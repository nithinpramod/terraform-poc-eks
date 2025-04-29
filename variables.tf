variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "eks-unencrypted-demo"
}

variable "subnet_ids" {
  default = ["subnet-0f7ed255f8bd5f2b5", "subnet-0ba62d96ae5fb33b1"]
}

variable "vpc_id" {
  default = "vpc-0aebab0bdccee06d2"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "desired_capacity" {
  default = 2
}
