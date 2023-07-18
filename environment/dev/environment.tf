module "vpc" {
  source = "../../modules/vpc"

  inf_env = var.inf_env

  public_subnets = local.public_subnets
  private_subnets = local.private_subnets
}

module "ec2" {
  source = "../../modules/ec2"

  inf_env = var.inf_env
  ami_key_pair_name = var.ami_key_pair_name
 
  subnet_id = module.vpc.vpc_private_subnet_ids[0] 
  #vpc_default_security_group_id = module.vpc.vpc_default_security_group_id
  other_security_groups = [module.security-group-tls.sec_gr_id]

  user_data = file(var.user_data_path)
  iam_instance_profile = module.iam_instance_profile.inst_pr_name
}

module "iam_instance_profile" {
  source = "../../modules/instance_profiles"

  inf_env = var.inf_env

  role_policy = file(var.role_policy_path)
  policies = var.role_policies
}

module "iam_resources" {
  source = "../../modules/instance_profiles/resources"

  inf_env = var.inf_env
}

module "security-group-tls" {
  source = "../../modules/security_groups"

  vpc_id = module.vpc.vpc_id
  sources = ["0.0.0.0/0"]
}

module "load-balancer" {
  source = "../../modules/load_balancer"

  inf_env = var.inf_env

  target_id = module.ec2.ec2_id[0]
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.vpc_private_subnet_ids
  security_groups = [module.security-group-tls.sec_gr_id] 
}

module "bastion" {
  source = "../../modules/ec2"
  
  inf_env = "${var.inf_env}-bastion"
  ami_key_pair_name = var.ami_key_pair_name

  subnet_id = module.vpc.vpc_public_subnet_ids[0]
  #vpc_default_security_group_id = module.vpc.vpc_default_security_group_id 
  other_security_groups = [module.security-group-tls.sec_gr_id]
}

