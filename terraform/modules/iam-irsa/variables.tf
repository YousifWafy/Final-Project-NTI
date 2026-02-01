variable "oidc_issuer_url" {
  description = "EKS OIDC issuer URL (usually starts with https://)"
  type        = string
}

variable "irsa_roles" {
  description = "Map of IRSA roles configurations"
  type = map(object({
    namespace            = string
    service_account_name = string
    policy_arns          = list(string)
  }))
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "cluster_name" {
  type = string
}