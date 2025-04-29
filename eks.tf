module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.11.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  subnet_ids = var.subnet_ids
  vpc_id     = var.vpc_id

  enable_irsa = true

  eks_managed_node_groups = {
    unencrypted_nodes = {
      name            = "unencrypted-ng"
      desired_size    = var.desired_capacity
      max_size        = 3
      min_size        = 1
      instance_types  = [var.node_instance_type]
      disk_size       = 20
      encrypted       = false

      tags = {
        Name = "eks-node-unencrypted-poc"
      }
    }
  }

  access_entries = {
    admin_user = {
      principal_arn = "arn:aws:sts::456130209114:federated-user/nct-admin/Nithin.NP@news.co.uk"
      kubernetes_groups = ["system:masters"]
      type = "STANDARD"
    }
  }

  tags = {
    Environment = "nonprod"
    Terraform   = "true"
  }
}
