resource "aws_internet_gateway" "learning-test-internet-gateway" {
  vpc_id = aws_vpc.learning-test-vpc.id

  tags = {
    Name = "learning-test-internet-gateway"
    ManagedBy = "terraform"
  }
}

resource "aws_eip" "learning-test-eip" {
  vpc = true

  tags = {
    Name = "learning-test-elastic_ip"
    ManagedBy = "terraform"
  }
}

resource "aws_nat_gateway" "learning-test-nat-gateway" {
  allocation_id = aws_eip.learning-test-eip.id 
  subnet_id = aws_subnet.learning-test-public-subnet.id

  tags = {
    Name = "learning-test-nat-gateway"
    ManagedBy = "terraform"
  }
}
