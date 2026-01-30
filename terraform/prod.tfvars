project_name        = "nti-devops"
environment         = "prod"
region              = "ap-northeast-2"
vpc_cidr            = "10.10.0.0/16"
public_subnet_cidr  = "10.10.1.0/24"
private_subnet_cidr = "10.10.11.0/24"
availability_zone   = "ap-northeast-2a"
cluster_name    = "prod-eks"

tags = {
  Project     = "nti-devops"
  Environment = "prod"
}   

