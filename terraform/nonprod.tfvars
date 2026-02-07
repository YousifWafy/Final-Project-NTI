project_name         = "nti-devops"
environment          = "nonprod"
region               = "ap-northeast-2"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
availability_zones   = ["ap-northeast-2a", "ap-northeast-2c"]
cluster_name         = "nonprod-eks"
cluster_version      = "1.30"

tags = {
  Project     = "nti-devops"
  Environment = "nonprod"
}

node_desired   = 1
node_min       = 1
node_max       = 2
instance_types = ["t3.medium"]
capacity_type  = "ON_DEMAND"

cognito_name = "nti-nonprod"