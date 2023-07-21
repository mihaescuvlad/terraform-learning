# AWS Management #####################################################

variable "aws_access_key_id" {
  description = "The AWS access key id"
  type = string
}

variable "aws_secret_access_key" {
  description = "The AWS secret key"
  type = string
}


variable "aws_region" {
  description = "The AWS region"
  type = string
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
  default = "../../modules/ec2/user-data/ec2-nginx-webserver.tpl"
}

variable "ami_key_pair_name" {
  description = "AMI Key-Pair name"
  type = string
}

variable "application_name" {
  description = "Name of the nginx application"
  type = string
  default = "webapp"
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

variable "s3_source" {
  description = "Path to a file that will be read and uploaded in the S3 bucket"
  type = string
}

# RDS Management #####################################################

variable "db_username" {
  description = "Username for the DB Object"
  type = string
}

variable "db_password" {
  description = "Password for the DB Object"
  type = string
}

# Local Variables ####################################################

locals {
  cidr_subnets = cidrsubnets(var.vpc_cidr_block, 4, 8, 8)
  private_subnets = slice(local.cidr_subnets, 0, 2) 
  public_subnets = slice(local.cidr_subnets, 2, 3)
}

