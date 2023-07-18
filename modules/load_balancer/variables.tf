variable "inf_env" {
  description = "Infrastructure Environment name"
  type = string
  default = "learning-test"
}

variable "internal" {
  description = "Define an internal load-balancer or not"
  type = bool
  default = false
}

variable "load_balancer_type" {
  description = "Define the type of load-balancer to use"
  type = string
  default = "application"
}

variable "subnets" {
  description = "A list of subnet ids to attach to the load-balancer"
  type = list(string)
  default = []
}

variable "security_groups" {
  description = "A list of security group ids to assign to the load balancer"
  type = list(string)
  default = []
}

variable "target_id" {
  description = "Id of the target machine"
  type = string
  default = ""
}

variable "target_port" {
  description = "Port on which targets reveice traffic"
  type = number
  default = 22
}

variable "target_protocol" {
  description = "Protocol to use for routing traffic to the trgets"
  type = string
  default = "TCP"
}

variable "vpc_id" {
  description = "The id of the VPC that will be used"
  type = string
  default = ""
}

