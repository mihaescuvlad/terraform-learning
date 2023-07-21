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

variable "ingress_port" {
  description = "Ingress port"
  type = number
  default = 22
}

variable "ingress_protocol" {
  description = "Ingress protocol"
  type = string
  default = "tcp"
}

variable "engress_port" {
  description = "Ingress port"
  type = number
  default = 0
}

variable "engress_protocol" {
  description = "Ingress protocol"
  type = string
  default = "-1"
}

