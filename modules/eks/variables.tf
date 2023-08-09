variable "inf_env" {
  description = "Name of the instance to be created"
  type = string
  default = ""
}

variable "cluster_subnet_ids" {
  description = "The IDs of the EKS cluster subnets"
  type = list(string)
  default = []
}

variable "nodegr_subnet_ids" {
  description = "The IDs of the EKS Node Group subnets"
  type = list(string)
  default = []
}

variable "instance_types" {
  description = "Instance type for the EC2"
  type = list(string)
  default = ["t2.micro"]
}

variable "assume_role_policy" {
  description = "File path of the role policy file"
  type = string
  default = ""
}

variable "policy_arn" {
  description = "Policy ARN for the Role Policy Attachment"
  type = list(string)
  default = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
}

variable "desired_scale_size" {
 description = "Desired node count for the EKS Node Group"
 type = number
 default = 2
}

variable "max_scale_size" {
 description = "Maximum node count for the EKS Node Group"
 type = number
 default = 2
}

variable "min_scale_size" {
 description = "Minimum node count for the EKS Node Group"
 type = number
 default = 2
}

