variable "tgw_id" {
  description = "The ID of the Transit Gateway"
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

variable "subnet_ids" {
  description = "The IDs of the subnets to use with TGW Attachment"
  type        = list(string)
}
