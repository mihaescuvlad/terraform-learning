resource "aws_instance" "ec2" {
  ami = var.ami_id
  count = var.number_of_instances

  subnet_id = var.subnet_id
  instance_type = var.instance_type
  iam_instance_profile = var.iam_instance_profile

  key_name = var.ami_key_pair_name
  security_groups = compact(concat([var.vpc_default_security_group_id], var.other_security_groups))

  user_data = var.user_data

  tags = {
    Name = "${var.inf_env}-ec2-${count.index}"
    ManagedBy = "terraform"
  }
}

