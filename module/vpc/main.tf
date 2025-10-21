data "aws_region" "current" {}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 4, 0)
  availability_zone = "${data.aws_region.current.name}a"
  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 4, 1)
  availability_zone = "${data.aws_region.current.name}a"
  tags = {
    Name = var.private_subnet_name
  }
}
