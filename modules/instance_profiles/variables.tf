variable "inf_env" {
  description = "Infrastructure Environment name"
  type = string
  default = "learning-test"
}

variable "role_policy" {
  description = "File path of the role policy file"
  type = string
  default = ""
}

variable "policies" {
  description = "The list of policies that will be attached to the role"
  type = list(string)
  default = []
}
