# AWS Management #####################################################

variable "aws_region" {
  description = "The AWS region"
  type = string
  default = "eu-central-1"
}

# VPC Management #####################################################

variable "inf_env" {
  description = "Infrastructure Environment name"
  type = string
  default = "learning-test"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.0.0.0/24"
}

#variable "public_subnets" {
#  description = "CIDR blocks for the public subnets"
#  type = list(string)
#  default = []
#}

#variable "private_subnets" {
#  description = "CIDR blocks for the private subnets"
#  type = list(string)
#  default = []
#}


# Local Variables ####################################################
locals {
  cidr_subnets = cidrsubnets(var.vpc_cidr_block, 4, 4, 4)
  private_subnets = slice(local.cidr_subnets, 0, 1) 
  public_subnets = slice(local.cidr_subnets, 1, 2)
}
