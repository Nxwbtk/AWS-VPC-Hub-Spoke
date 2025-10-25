variable "tgw_name" {
  description = "The name of the Transit Gateway"
  type        = string
}

variable "vpc_id" {
  description = "The ID of VPC to use with TGW Attachment"
  type        = string
}

variable "tgw_attachment_name" {
  description = "The name of the Transit Gateway attachment"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the subnet to use with TGW Attachment"
  type        = string
}

variable "tgw_route_table_name" {
  description = "Name of transit gateway route table"
  type        = string
}
