output "oidc_provider_arn" {
  description = "ARN of the IAM OIDC provider"
  value       = aws_iam_openid_connect_provider.this.arn
}

output "irsa_role_arns" {
  description = "Map of IRSA role ARNs keyed by role name in irsa_roles"
  value       = { for k, r in aws_iam_role.this : k => r.arn }
}

output "irsa_role_names" {
  description = "Map of IRSA role names keyed by role name in irsa_roles"
  value       = { for k, r in aws_iam_role.this : k => r.name }
}