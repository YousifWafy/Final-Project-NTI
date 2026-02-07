output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_ca" {
  value     = module.eks.cluster_certificate_authority_data
  sensitive = true
}

output "oidc_issuer_url" {
  value = module.eks.oidc_issuer_url
}

output "oidc_provider_arn" {
  value = module.iam_irsa.oidc_provider_arn
}

output "irsa_role_arns" {
  value = module.iam_irsa.irsa_role_arns
}

output "cognito_user_pool_id" {
  value = module.cognito.user_pool_id
}

output "cognito_app_client_id" {
  value = module.cognito.app_client_id
}

output "cognito_issuer_url" {
  value = module.cognito.issuer_url
}

output "api_gateway_endpoint" {
  value = module.api_gw.api_endpoint
}