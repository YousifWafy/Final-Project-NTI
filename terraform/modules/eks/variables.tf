variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
}

variable "cluster_role_arn" {
  description = "IAM role ARN for EKS cluster"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "enabled_cluster_log_types" {
  type    = list(string)
  default = ["api", "audit"]
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "log_retention_in_days" {
  type    = number
  default = 7
}