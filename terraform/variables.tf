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

