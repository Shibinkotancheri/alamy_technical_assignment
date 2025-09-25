
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.34.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.28"
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  node_groups = {
    default = {
      desired_capacity = 2
      min_capacity     = 1
      max_capacity     = 3
      instance_type    = "t3.medium"
    }
  }

  manage_aws_auth = true
}
