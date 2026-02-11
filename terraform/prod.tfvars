project_name         = "nti-devops"
environment          = "prod"
region               = "ap-northeast-2"
vpc_cidr             = "10.10.0.0/16"
public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnet_cidrs = ["10.10.11.0/24", "10.10.12.0/24"]
availability_zones   = ["ap-northeast-2a", "ap-northeast-2c"]
cluster_name         = "prod-eks"
cluster_version      = "1.30"

tags = {
  Project     = "nti-devops"
  Environment = "prod"
}

node_desired   = 2
node_min       = 2
node_max       = 4
instance_types = ["t3.large"]
capacity_type  = "ON_DEMAND"

cognito_name = "nti-prod"

api_gw_name = "nti-prod-api"

nlb_listener_arn = ""
enable_nlb       = false
enable_aws_lbc   = false