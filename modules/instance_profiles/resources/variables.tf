variable "inf_env" {
  description = "Infrastructure Environment name"
  type = string
  default = "learning-test"
}

variable "s3_source" {
  description = "Path to a file that will be read and uploaded as raw bytes for the object content"
  type = string
  default = ""
}
