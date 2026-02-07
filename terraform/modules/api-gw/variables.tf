variable "name" {
  type        = string
  description = "Name prefix for API Gateway resources"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs used for API Gateway VPC Link"
}

variable "nlb_listener_arn" {
  type        = string
  description = "NLB Listener ARN (port 80) created by ingress-nginx service"
}

variable "cognito_issuer_url" {
  type        = string
  description = "Cognito issuer URL"
}

variable "cognito_audience" {
  type        = string
  description = "Cognito App Client ID (JWT audience)"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where API Gateway VPC Link security group will be created"
}