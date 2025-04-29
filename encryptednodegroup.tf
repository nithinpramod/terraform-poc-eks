resource "aws_eks_node_group" "encrypted_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "eks-node-unencrypted-poc"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  launch_template {
    id      = aws_launch_template.eks_encrypted_lt.id
    version = "$Latest"
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name        = "eks-encrypted-nodegroup"
    Environment = "nonprod"
  }

  depends_on = [aws_launch_template.eks_encrypted_lt]
}
