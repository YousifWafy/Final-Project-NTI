variable "name" { type = string }

variable "private_subnet_ids" {
  type = list(string)
}

variable "nlb_listener_arn" {
  description = "NLB Listener ARN created later by ingress-nginx service"
  type        = string
}

variable "cognito_issuer_url" { type = string }
variable "cognito_audience"   { type = string } 

variable "tags" {
  type    = map(string)
  default = {}
}