provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "tf-poc-bucket-eks"
    key            = "eks/eks-node-unencrypted-poc/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}