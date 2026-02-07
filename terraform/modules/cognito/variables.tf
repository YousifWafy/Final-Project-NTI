variable "name" {
  description = "Prefix name for Cognito resources"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}