variable "inf_env" {
  description = "Name of the instance to be created"
  type = string
  default = ""
}

variable "vpc_id" {
  description = "The id of the VPC where the security group will be created"
  type = string
}

variable "private_subnets" {
  description = "List of private subnets"
  type = list(string)
}

