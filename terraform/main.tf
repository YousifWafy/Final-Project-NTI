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

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  cluster_role_arn   = module.iam.cluster_role_arn
  node_role_arn      = module.iam.node_role_arn
  private_subnet_ids = module.vpc.private_subnet_ids

  endpoint_public_access  = var.endpoint_public_access
  endpoint_private_access = var.endpoint_private_access

  node_desired   = var.node_desired
  node_min       = var.node_min
  node_max       = var.node_max

  instance_types = var.instance_types
  capacity_type  = var.capacity_type

  ebs_csi_service_account_role_arn = module.iam_irsa.irsa_role_arns["ebs_csi"]

  tags = var.tags
}

module "iam_irsa" {
  source = "./modules/iam-irsa"

  oidc_issuer_url = module.eks.oidc_issuer_url
  cluster_name     = var.cluster_name
  irsa_roles = {
    ebs_csi = {
      namespace            = "kube-system"
      service_account_name = "ebs-csi-controller-sa"
      policy_arns = [
        "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
      ]
    }
  }

  tags = var.tags
}

resource "aws_eks_addon" "ebs_csi" {
  cluster_name             = module.eks.cluster_name
  addon_name               = "aws-ebs-csi-driver"
  service_account_role_arn = module.irsa.irsa_role_arns["ebs_csi"]

  resolve_conflicts_on_update = "OVERWRITE"
  tags                       = var.tags
}