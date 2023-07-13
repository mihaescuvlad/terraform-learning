output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_public_subnet_ids" {
  value = aws_subnet.public-subnet.*.id
}

output "vpc_private_subnet_ids" {
  value = aws_subnet.private-subnet.*.id
}

output "vpc_default_security_group_id" {
  value = aws_vpc.vpc.default_security_group_id
}
