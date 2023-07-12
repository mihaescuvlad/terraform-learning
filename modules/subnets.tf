resource "aws_subnet" "learning-test-public-subnet" {
  vpc_id = aws_vpc.learning-test-vpc.id
  cidr_block = var.public_subnet_cidr_blocks[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "learning-test-public-subnet"
  }
}

resource "aws_subnet" "learning-test-private-subnet" {
  count = length(var.private_subnet_cidr_blocks)
  vpc_id = aws_vpc.learning-test-vpc.id
  cidr_block = var.private_subnet_cidr_blocks[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "learning-test-private-subnet-${count.index}"
    ManagedBy = "terraform"
  }
}
