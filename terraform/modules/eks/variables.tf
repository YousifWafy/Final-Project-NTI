variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "IAM role ARN used by the EKS control plane"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN used by the EKS worker nodes"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs where the EKS cluster and node groups will be deployed"
  type        = list(string)
}

variable "endpoint_public_access" {
  description = "Whether the EKS public API server endpoint is enabled"
  type        = bool
  default     = true
}

variable "endpoint_private_access" {
  description = "Whether the EKS private API server endpoint is enabled"
  type        = bool
  default     = false
}

variable "enabled_cluster_log_types" {
  description = "List of control plane log types to enable for the EKS cluster"
  type        = list(string)
  default     = ["api", "audit"]
}

variable "log_retention_in_days" {
  description = "Number of days to retain EKS control plane logs in CloudWatch"
  type        = number
  default     = 7
}

variable "node_desired" {
  description = "Desired number of worker nodes in the node group"
  type        = number
  default     = 2
}

variable "node_min" {
  description = "Minimum number of worker nodes in the node group"
  type        = number
  default     = 1
}

variable "node_max" {
  description = "Maximum number of worker nodes in the node group"
  type        = number
  default     = 3
}

variable "instance_types" {
  description = "List of EC2 instance types used for EKS worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "capacity_type" {
  description = "Capacity type for the EKS node group (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}

variable "tags" {
  description = "Common tags to apply to all EKS resources"
  type        = map(string)
  default     = {}
}

variable "ebs_csi_service_account_role_arn" {
  description = "IAM role ARN used by the EBS CSI driver via IRSA"
  type        = string
  default     = null
}