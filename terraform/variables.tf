variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "availability_zones" {
  description = "AWS availability zone to deploy resources"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR block for the public subnet"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR block for the private subnet"
  type        = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "cluster_name" {
  type = string
}

variable "endpoint_public_access" {
  type    = bool
  default = true
}

variable "endpoint_private_access" {
  type    = bool
  default = false
}

variable "attach_ssm" {
  type    = bool
  default = true
}

variable "enabled_cluster_log_types" {
  type    = list(string)
  default = ["api", "audit"]
}

variable "log_retention_in_days" {
  type    = number
  default = 7
}

variable "cluster_version" {
  type = string
}

variable "node_desired" {
  type    = number
  default = 2
}

variable "node_min" {
  type    = number
  default = 1
}

variable "node_max" {
  type    = number
  default = 3
}

variable "instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "cognito_name" {
  description = "Name prefix for Cognito resources (user pool and app client)"
  type        = string
}

variable "api_gw_name" {
  type        = string
  description = "Name prefix for API Gateway"
}

variable "nlb_listener_arn" {
  type        = string
  description = "NLB Listener ARN (from ingress-nginx NLB listener 80)"
}

variable "enable_nlb" {
  type    = bool
  default = false
}

variable "enable_aws_lbc" {
  type    = bool
  default = false
}