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
  default = "10.0.0.0/16"
}

# EC2 Management #####################################################
variable "user_data_path" {
  description = "File path of the user data file"
  type = string
  default = "../../modules/ec2/user-data/ec2-nginx-webserver.sh"
}

variable "ami_key_pair_name" {
  description = "AMI Key-Pair name"
  type = string
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
  cidr_subnets = cidrsubnets(var.vpc_cidr_block, 4, 8, 8)
  private_subnets = slice(local.cidr_subnets, 0, 2) 
  public_subnets = slice(local.cidr_subnets, 2, 3)
}

