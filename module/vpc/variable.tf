variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of first subnet"
  type        = string
}

variable "private_subnet_name" {
  description = "Name of first private subnet"
  type        = string
}
