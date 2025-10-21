terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-7"
}

module "inspection_vpc" {
  source              = "./module/vpc"
  vpc_name            = var.Inspection_VPC_name
  cidr_block          = var.Inspection_VPC_cidr
  public_subnet_name  = var.Inspection_VPC_public_subnet_name
  private_subnet_name = var.Inspection_VPC_private_subnet_name
}

module "egress_vpc" {
  source              = "./module/vpc"
  vpc_name            = var.Egress_VPC_name
  cidr_block          = var.Egress_VPC_cidr
  public_subnet_name  = var.Egress_VPC_public_subnet_name
  private_subnet_name = var.Egress_VPC_private_subnet_name
}
