data "aws_region" "current" {}


resource "aws_ec2_transit_gateway" "main" {
  description = "Central Transit Gateway"
  tags = {
    Name = var.tgw_name
  }
}
