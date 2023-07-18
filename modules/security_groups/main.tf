resource "aws_security_group" "secgr" {
  name = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.sources
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.inf_env}-secgr"
    ManagedBy = "terraform"
  }
}
