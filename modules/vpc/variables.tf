variable "inf_env" {
  description = "Infrastructure Environment name"
  type = string
  default = "test"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type = bool
  default = true
}

variable "public_subnets" {
  description = "CIDR blocks for the public subnets"
  type = list(string)
  default = []
}

variable "private_subnets" {
  description = "CIDR blocks for the private subnets"
  type = list(string)
  default = []
}

