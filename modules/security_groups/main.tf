resource "aws_security_group" "secgr" {
  name = "${var.inf_env}-allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id = var.vpc_id

  ingress {
    from_port = var.ingress_port
    to_port = var.ingress_port
    protocol = var.ingress_protocol
    cidr_blocks = var.sources
  }

  egress {
    from_port = var.engress_port
    to_port = var.engress_port
    protocol = var.engress_protocol
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.inf_env}-secgr"
    ManagedBy = "terraform"
  }
}
