provider "aws" {
  region  = "us-east-1"
}

locals {
  cluster_name = "EKS-Cluster-Testing"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.6.0"

  name                 = "${local.cluster_name}-VPC"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true


  tags = {
    "Name"	= local.cluster_name
  }

  public_subnet_tags = {
    "Name" 	= "${local.cluster_name}-Public"
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "Name"	= "${local.cluster_name}-Private"
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}
