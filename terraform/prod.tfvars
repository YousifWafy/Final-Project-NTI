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

