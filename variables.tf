variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "eks-unencrypted-demo"
}

variable "subnet_ids" {
  default = ["subnet-0557c5dc8bde8cc2a", "subnet-0599e0eb972152dbd"]
}

variable "vpc_id" {
  default = "vpc-025d364dfa957d9e5"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "desired_capacity" {
  default = 2
}
