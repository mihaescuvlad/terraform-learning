output "db_url" {
 value = "jdbc:${aws_db_instance.db_instance.engine}://${aws_db_instance.db_instance.endpoint}/${aws_db_instance.db_instance.db_name}?user=${aws_db_instance.db_instance.username}&password=${aws_db_instance.db_instance.password}"
}
