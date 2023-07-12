resource "aws_internet_gateway" "learning-test-internet-gateway" {
  vpc_id = aws_vpc.learning-test-vpc.id

  tags = {
    Name = "learning-test-internet-gateway"
    ManagedBy = "terraform"
  }
}

resource "aws_eip" "learning-test-eip" {
  count = length(aws_subnet.learning-test-private-subnet)
  domain = "vpc"

  tags = {
    Name = "learning-test-elastic-ip-${count.index}"
    ManagedBy = "terraform"
  }
}

resource "aws_nat_gateway" "learning-test-nat-gateway" {
  count = length(aws_subnet.learning-test-private-subnet)
  allocation_id = aws_eip.learning-test-eip[count.index].id 
  subnet_id = aws_subnet.learning-test-private-subnet[count.index].id  

  tags = {
    Name = "learning-test-nat-gateway-${count.index}"
    ManagedBy = "terraform"
  }
}
