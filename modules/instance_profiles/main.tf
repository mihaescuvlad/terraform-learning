resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "${var.inf_env}-instance-profile"
  role = aws_iam_role.iam_role.name

  depends_on = [ aws_iam_role.iam_role ]
}

resource "aws_iam_role" "iam_role" {
  name = "${var.inf_env}-role"
  assume_role_policy = var.role_policy
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  count = length(var.policies)

  role = aws_iam_role.iam_role.name
  policy_arn = var.policies[count.index]
}
