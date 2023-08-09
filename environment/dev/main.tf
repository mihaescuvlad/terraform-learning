terraform {
  required_providers {
    aws = {
    source  = "hashicorp/aws"
    version = "5.7.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.22.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region = var.aws_region
}
