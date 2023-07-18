variable "inf_env" {
  description = "Name of the instance to be created"
  type = string
  default = ""
}

variable "vpc_id" {
  description = "The id of the VPC where the security group will be created"
  type = string
}

variable "sources" {
  description = "List of source IPs"
  type = list(string)
}

