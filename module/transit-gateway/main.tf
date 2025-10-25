data "aws_region" "current" {

}


resource "aws_ec2_transit_gateway" "main" {
  description = "Central Transit Gateway"
  tags = {
    Name = var.tgw_name
  }
}

resource "aws_ec2_transit_gateway_route_table" "main" {
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  tags = {
    "Name" = var.tgw_route_table_name
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = var.vpc_id
  subnet_ids         = [var.cidr_block]
  tags = {
    "Name" = var.tgw_attachment_name
  }
}
