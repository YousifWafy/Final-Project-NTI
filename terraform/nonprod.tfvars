project_name        = "nti-devops"
environment         = "nonprod"
region              = "ap-northeast-2"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.11.0/24"
availability_zone   = "ap-northeast-2a"
cluster_name        = "nonprod-eks"
cluster_version     = "1.30"

tags = {
  Project     = "nti-devops"
  Environment = "nonprod"
}



