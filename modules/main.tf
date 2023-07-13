terraform {
  required_providers {
    aws = {
    source  = "hashicorp/aws"
    version = "5.7.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}
