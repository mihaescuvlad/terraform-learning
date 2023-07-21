variable "inf_env" {
  description = "Name of the instance to be created"
  type = string
  default = ""
}

variable "db_name" {
  description = "Name of the database instance"
  type = string
  default = "implicitdb"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type = string 
  default = "db.t2.micro"
}

variable "allocated_storage" {
  description = "The allocated storage in gibibytes"
  type = number
  default = 20
}

variable "storage_type" {
  description = "Type of storage"
  type = string
  default = "gp2"
}

variable "engine" {
  description = "The engine for the RDS instance"
  type = string
  default = "mysql"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type = list(string)
  default = []
}

variable "username" {
  description = "The username for the RDS instance"
  type = string
}

variable "password" {
  description = "The password for the RDS instance"
  type = string
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type = list(string)
  default = []
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type = bool
  default = true
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type = bool
  default = true
}
