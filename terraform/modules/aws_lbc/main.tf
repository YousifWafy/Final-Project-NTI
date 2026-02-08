locals {
  namespace       = "kube-system"
  sa_name         = "aws-load-balancer-controller"
  oidc_issuer_host = replace(var.oidc_issuer_url, "https://", "")
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [var.oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_issuer_host}:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_issuer_host}:sub"
      values   = ["system:serviceaccount:${local.namespace}:${local.sa_name}"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = "${var.cluster_name}-aws-lbc-irsa-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.tags
}

resource "aws_iam_policy" "this" {
  name   = "${var.cluster_name}-aws-lbc-policy"
  policy = file("${path.module}/iam_policy.json")
  tags   = var.tags
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "helm_release" "aws_lbc" {
  name       = "aws-load-balancer-controller"
  namespace  = local.namespace
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.7.2"
  timeout = 900
  wait    = true

  values = [
    yamlencode({
      clusterName = var.cluster_name
      region      = var.region

      serviceAccount = {
        create = true
        name   = local.sa_name
        annotations = {
          "eks.amazonaws.com/role-arn" = aws_iam_role.this.arn
        }
      }
    })
  ]

  depends_on = [aws_iam_role_policy_attachment.attach]
}

data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

