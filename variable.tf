variable "Inspection_VPC_name" {
  description = "VPC Name of inspection vpc"
  type        = string
}

variable "Inspection_VPC_cidr" {
  description = "CIDR block for Inspection VPC"
  type        = string
}

variable "Egress_VPC_name" {
  description = "VPC Name of egress vpc"
  type        = string
}

variable "Egress_VPC_cidr" {
  description = "CIDR block for Egress VPC"
  type        = string
}

variable "Inspection_VPC_public_subnet_name" {
  description = "Name of public subnet in Inspection VPC"
  type        = string
}

variable "Inspection_VPC_private_subnet_name" {
  description = "Name of private subnet in Inspection VPC"
  type        = string
}

variable "Egress_VPC_public_subnet_name" {
  description = "Name of public subnet in Egress VPC"
  type        = string
}

variable "Egress_VPC_private_subnet_name" {
  description = "Name of private subnet in Egress VPC"
  type        = string
}
