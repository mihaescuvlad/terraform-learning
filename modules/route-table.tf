resource "aws_route_table" "learning-test-public-rt" {
  vpc_id = aws_vpc.learning-test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.learning-test-internet-gateway.id
  }

  tags = {
    Name = "learning-test-public-rt"
    ManagedBy = "terraform"
  }
}

resource "aws_route_table_association" "learning-test-pub-rt-association" {
  subnet_id = aws_subnet.learning-test-public-subnet.id
  route_table_id = aws_route_table.learning-test-public-rt.id
}

resource "aws_route_table" "learning-test-private-rt" {
  vpc_id = aws_vpc.learning-test-vpc.id
  count = length(aws_subnet.learning-test-private-subnet)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.learning-test-nat-gateway[count.index].id
  }

  tags = {
    Name = "learning-test-private-rt-${count.index}"
    ManagedBy = "terraform"
  }
}

resource "aws_route_table_association" "learning-test-priv-rt-association" {
  count = length(aws_subnet.learning-test-private-subnet)

  subnet_id = aws_subnet.learning-test-private-subnet[count.index].id
  route_table_id = aws_route_table.learning-test-private-rt[count.index].id
}
