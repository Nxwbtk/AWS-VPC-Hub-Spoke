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

module "tgw" {
  source   = "./module/transit-gateway"
  tgw_name = var.Transit_Gateway_name
}

module "inspection-attachment-tgw-subnet" {
  source              = "./module/transit-gateway/attachment"
  tgw_id              = module.tgw.tgw_id
  vpc_id              = module.inspection_vpc.vpc_id
  tgw_attachment_name = "Inspection-VPC-Attachment"
  subnet_ids          = [module.inspection_vpc.private_subnet_id]
}

module "inspection-attachment-firewall-subnet" {
  source              = "./module/transit-gateway/attachment"
  tgw_id              = module.tgw.tgw_id
  vpc_id              = module.inspection_vpc.vpc_id
  tgw_attachment_name = "Inspection-Firewall-Attachment"
  subnet_ids          = [module.inspection_vpc.public_subnet_id]
}

module "spoke-inspection-tgw_route_table" {
  source               = "./module/transit-gateway/route-table"
  tgw_id               = module.tgw.tgw_id
  tgw_route_table_name = "Spoke-Inspection-Route-Table"
}


module "firewall-spoke-tgw_route_table" {
  source               = "./module/transit-gateway/route-table"
  tgw_id               = module.tgw.tgw_id
  tgw_route_table_name = "Firewall-Spoke-Route-Table"
}

