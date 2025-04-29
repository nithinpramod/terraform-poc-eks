
# EKS Cluster and Node Group
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.11.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  subnet_ids = var.subnet_ids
  vpc_id     = var.vpc_id

  eks_managed_node_groups = {
    unencrypted_nodes = {
      desired_size = var.desired_capacity
      max_size     = 3
      min_size     = 1

      instance_types = [var.node_instance_type]
      disk_size      = 20  # EBS volume, unencrypted by default
      encrypted       = false
      # kms_key_id      = aws_kms_key.eks_cmk.arn  # or use var.kms_key_id

      tags = {
        Name = "eks-node-unencrypted-poc"
      }
    }
  }

  enable_irsa = true

  tags = {
    Environment = "nonprod"
    Terraform   = "true"
  }
}
