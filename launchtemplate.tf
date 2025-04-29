resource "aws_launch_template" "eks_encrypted_lt" {
  name_prefix   = "eks-encrypted-lt-"
  image_id      = "ami-0713ff1f7e8b62b45"  # <-- your encrypted AMI
  instance_type = "t3.medium"

  key_name = null  # Optional: set your EC2 key pair name if needed

  iam_instance_profile {
    name = aws_iam_instance_profile.eks_node_instance_profile.name
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = 20
      encrypted             = true
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "eks-node-unencrypted-poc"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
  # Optional: bootstrap node to join cluster
  user_data = base64encode(<<-EOF
    #!/bin/bash
    set -o xtrace
    /etc/eks/bootstrap.sh ${var.cluster_name}
  EOF
  )
}
