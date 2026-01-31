module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "iam" {
  source = "./modules/iam"

  cluster_name = var.cluster_name
  attach_ssm   = var.attach_ssm
  tags         = var.tags
}

module "eks" {
  source = "./modules/eks"

  cluster_name              = var.cluster_name
  cluster_version           = var.cluster_version
  private_subnet_ids        = module.vpc.private_subnet_ids
  cluster_role_arn          = module.iam.eks_cluster_role_arn
  log_retention_in_days     = var.log_retention_in_days
  enabled_cluster_log_types = var.enabled_cluster_log_types
  tags                      = var.tags
}