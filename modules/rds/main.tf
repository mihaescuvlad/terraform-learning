resource "aws_db_instance" "db_instance" {
  identifier = "${var.inf_env}-database-0"
  db_name = var.db_name

  instance_class = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type = var.storage_type
  engine = var.engine
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = var.vpc_security_group_ids
  username = var.username
  password = var.password
  publicly_accessible = var.publicly_accessible
  skip_final_snapshot = var.skip_final_snapshot
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name = "${var.inf_env}-dbsg-0"

  subnet_ids = var.subnet_ids
}
