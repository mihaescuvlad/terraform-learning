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

# EC2 Management #####################################################
variable "user_data_path" {
  description = "File path of the user data file"
  type = string
  default = "../../modules/ec2/user-data/ec2-nginx-webserver.sh"
}

# Instance Profile Management ########################################

variable "role_policy_path" {
  description = "File path of the role policy file"
  type = string
  default = "../../modules/instance_profiles/role-policy/role-policy.json"
}

variable "role_policies" {
  description = "The list of policies that will be attached to the role"
  type = list(string)
  default = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess", "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"] 
}

# Local Variables ####################################################

locals {
  cidr_subnets = cidrsubnets(var.vpc_cidr_block, 4, 4, 4)
  private_subnets = slice(local.cidr_subnets, 0, 1) 
  public_subnets = slice(local.cidr_subnets, 1, 2)
}

