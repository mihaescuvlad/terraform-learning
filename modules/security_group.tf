resource "aws_security_group" "learning-test-secgr-basic" {
  name = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id = aws_vpc.learning-test-vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.private_subnet_cidr_blocks
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
    ManagedBy = "terraform"
  }
}
