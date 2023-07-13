# General Variables ##############################################
variable "aws_access_key" {
  description = "The access key to the AWS console"
  type = string
}

variable "aws_secret_key" {
  description = "The access key to the AWS console"
  type = string
}

variable "aws_region" {
  description = "The AWS region"
  type = string
  default = "eu-central-1"
}

# VPC Variables ##################################################
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

# EC2 Variables ##################################################
variable "instance_name" {
  description = "Name of the instance to be created"
  type = string
  default = "learning-test-ec2"
}

variable "instance_type" {
  description = "Instance type for the EC2"
  type = string
  default = "t2.micro"
}

variable "ami_id" {
  description = "The AMI to use"
  type = string
  default = "ami-07ce6ac5ac8a0ee6f"
}

variable "number_of_instances" {
  description = "number of instances to be created"
  type = number
  default = 1
}


variable "ami_key_pair_name" {
  description = "Key-Pair name for the AMI"
  type = string
  default = ""
}
