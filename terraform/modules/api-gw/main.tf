resource "aws_apigatewayv2_api" "this" {
  name          = "${var.name}-http-api"
  protocol_type = "HTTP"
  tags          = var.tags
}

resource "aws_apigatewayv2_vpc_link" "this" {
  name       = "${var.name}-vpc-link"
  subnet_ids = var.private_subnet_ids
  tags       = var.tags
}

resource "aws_apigatewayv2_integration" "nlb" {
  api_id                 = aws_apigatewayv2_api.this.id
  integration_type       = "HTTP_PROXY"
  integration_method     = "ANY"
  connection_type        = "VPC_LINK"
  connection_id          = aws_apigatewayv2_vpc_link.this.id
  integration_uri        = var.nlb_listener_arn
  payload_format_version = "1.0"
}

resource "aws_apigatewayv2_authorizer" "cognito" {
  api_id           = aws_apigatewayv2_api.this.id
  name             = "${var.name}-cognito-authorizer"
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]

  jwt_configuration {
    issuer   = var.cognito_issuer_url
    audience = [var.cognito_audience]
  }
}

resource "aws_apigatewayv2_route" "proxy" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "ANY /{proxy+}"

  target = "integrations/${aws_apigatewayv2_integration.nlb.id}"

  authorization_type = "JWT"
  authorizer_id      = aws_apigatewayv2_authorizer.cognito.id
}

resource "aws_apigatewayv2_stage" "this" {
  api_id      = aws_apigatewayv2_api.this.id
  name        = "$default"
  auto_deploy = true
  tags        = var.tags
}