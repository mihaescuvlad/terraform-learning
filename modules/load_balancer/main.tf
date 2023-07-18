resource "aws_lb" "lb" {
  name ="${var.inf_env}-lb-0"

  internal = var.internal
  load_balancer_type = var.load_balancer_type
  subnets = var.subnets
  security_groups = var.security_groups
}

resource "aws_lb_target_group" "lb_target_group" {
  name = "${var.inf_env}-lbtg-0" 

  port = var.target_port
  protocol = var.target_protocol
  vpc_id = var.vpc_id
}

resource "aws_lb_target_group_attachment" "lb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id = var.target_id
  port = var.target_port
}
