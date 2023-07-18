resource "aws_vpc" "vpc" {
  #count = length(aws_subnet.public_subnet)
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = "${var.inf_env}-vpc"
    ManagedBy = "terraform"
  }
}

resource "aws_subnet" "public-subnet" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zone[count.index % length(var.availability_zone)]
  cidr_block = var.public_subnets[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.inf_env}-public-subnet-${count.index}"
    ManagedBy = "terraform"
  }
}

resource "aws_subnet" "private-subnet" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zone[count.index % length(var.availability_zone)] 
  cidr_block = var.private_subnets[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.inf_env}-private-subnet-${count.index}"
    ManagedBy = "terraform"
  }
}

resource "aws_internet_gateway" "internet-gateway" {
  count = length(aws_subnet.public-subnet)
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.inf_env}-internet-gateway-${count.index}"
    ManagedBy = "terraform"
  }
}

resource "aws_eip" "eip" {
  count = length(aws_subnet.private-subnet)
  domain = "vpc"

  tags = {
    Name = "${var.inf_env}-eip-${count.index}"
    ManagedBy = "terraform"
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  count = length(aws_subnet.private-subnet)
  allocation_id = aws_eip.eip[count.index].id 
  #subnet_id = aws_subnet.private-subnet[count.index].id  
  subnet_id = aws_subnet.public-subnet[0].id

  tags = {
    Name = "${var.inf_env}-nat-gateway-${count.index}"
    ManagedBy = "terraform"
  }
}

resource "aws_route_table" "public-rt" {
  count = length(aws_subnet.public-subnet)
  vpc_id = aws_vpc.vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway[count.index].id
  }

  tags = {
    Name = "${var.inf_env}-public-rt-${count.index}"
    ManagedBy = "terraform"
  }
}

resource "aws_route_table_association" "pub-rt-association" {
  count = length(aws_subnet.public-subnet)
  
  subnet_id = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public-rt[count.index].id
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id
  count = length(aws_subnet.private-subnet)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway[count.index].id
  }

  tags = {
    Name = "${var.inf_env}-private-rt-${count.index}"
    ManagedBy = "terraform"
  }
}

resource "aws_route_table_association" "priv-rt-association" {
  count = length(aws_subnet.private-subnet)

  subnet_id = aws_subnet.private-subnet[count.index].id
  route_table_id = aws_route_table.private-rt[count.index].id
}

