variable "aws_region" {
  description = "The AWS region to create the VPC in"
  type = string
  default = "eu-central-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for the public subnets"
  type = list(string)
  default = ["10.0.1.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for the private subnets"
  type = list(string)
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}
