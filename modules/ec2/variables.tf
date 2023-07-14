variable "subnet_id" {
  description = "The ID of the subnet"
  type = string
}

variable "inf_env" {
  description = "Name of the instance to be created"
  type = string
  default = ""
}

variable "instance_type" {
  description = "Instance type for the EC2"
  type = string
  default = "t2.micro"
}

variable "iam_instance_profile" {
  description = "Instance profile name to be used with the EC2"
  type = string
  default = ""
}

variable "ami_id" {
  description = "The AMI to use"
  type = string
  default = "ami-07ce6ac5ac8a0ee6f"
}

variable "number_of_instances" {
  description = "Number of instances to be created"
  type = number
  default = 1
}

variable "ami_key_pair_name" {
  description = "Key-Pair name for the AMI"
  type = string
  default = ""
}

variable  "vpc_default_security_group_id" {
  description = "Default security group id from the VPS"
  type = string
  default = ""
}


variable "user_data" { 
  description = "File Path to user data"
  type = string 
  default = ""
}

variable "other_security_groups" {
  description = "List of other security groups that should be added other than the default security group"
  type = list(string)
  default = []
}
