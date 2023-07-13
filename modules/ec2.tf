resource "aws_instance" "learning-test-ec2" {
  ami = var.ami_id
  count = var.number_of_instances

  subnet_id = aws_subnet.learning-test-private-subnet[0].id 
  instance_type = var.instance_type

  key_name = var.ami_key_pair_name
  security_groups = compact(concat([aws_vpc.learning-test-vpc.default_security_group_id], [aws_security_group.learning-test-secgr-basic.id]))

  tags = {
    Name = "learning-test-ec2"
    ManagedBy = "terraform"
  }
} 
