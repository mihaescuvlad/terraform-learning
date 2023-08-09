resource "aws_eks_cluster" "eks_cluster" {
  name = "${var.inf_env}-eks-cluster-0"
  role_arn = aws_iam_role.iam_role.arn

  vpc_config {
    subnet_ids = var.cluster_subnet_ids
  }

  tags = {
    Name = "${var.inf_env}-eks-cluster-0"
  }

  depends_on = [aws_iam_role_policy_attachment.iam_role_policy_attachment]
}

resource "aws_iam_role" "iam_role" {
  name = "${var.inf_env}-eks-role-0"

  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  count = length(var.policy_arn) 
  policy_arn = var.policy_arn[count.index]
  role = aws_iam_role.iam_role.name
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  node_role_arn = aws_iam_role.iam_role.arn
  node_group_name = "${var.inf_env}-eks-nodegr-0"

  subnet_ids = var.nodegr_subnet_ids
  instance_types = var.instance_types

  scaling_config {
    desired_size = var.desired_scale_size
    max_size = var.max_scale_size
    min_size = var.min_scale_size
  }
}


