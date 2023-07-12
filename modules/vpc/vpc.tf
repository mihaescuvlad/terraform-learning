resource "aws_vpc" "learning-test-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "learning-test-vpc"
    ManagedBy = "terraform"
  }
}
