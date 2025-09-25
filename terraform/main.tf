locals {
  env_prefix = terraform.workspace != "default" ? terraform.workspace : "dev"
}

resource "aws_ecr_repository" "webapp" {
  name = "${local.env_prefix}-alamy-webapp"
  region = var.region
  image_scanning_configuration { scan_on_push = true }
}

# VPC module
module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

# EKS module
module "eks" {
  source       = "./modules/eks"
  region = var.region
  cluster_name = "${local.env_prefix}-${var.cluster_name}"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnets
}


