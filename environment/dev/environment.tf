module "vpc" {
  source = "../../modules/vpc"

  inf_env = var.inf_env

  public_subnets = local.public_subnets
  private_subnets = local.private_subnets
}

data "template_file" "nginx_setup" {
  template = file(var.user_data_path)

  vars = {
    bucket_name = module.iam_resources.bucket_name
    application_name = var.application_name
    db_user = var.db_username
    db_pass = var.db_password
    db_url = module.database.db_url
  }

  depends_on = [ module.database ]
}

module "ec2" {
  source = "../../modules/ec2"

  inf_env = var.inf_env
  ami_key_pair_name = var.ami_key_pair_name
 
  subnet_id = module.vpc.vpc_private_subnet_ids[0] 
  #vpc_default_security_group_id = module.vpc.vpc_default_security_group_id
  other_security_groups = [module.security-group-tls.sec_gr_id]

  #user_data = file(var.user_data_path)
  user_data = data.template_file.nginx_setup.rendered
  iam_instance_profile = module.iam_instance_profile.inst_pr_name

  depends_on = [ module.vpc ]
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
  s3_source = var.s3_source
}

module "security-group-tls" {
  source = "../../modules/security_groups"

  inf_env = "${var.inf_env}-0"
  vpc_id = module.vpc.vpc_id
  sources = ["0.0.0.0/0"]
}

module "security-group-db" {
  source = "../../modules/security_groups"

  inf_env = "${var.inf_env}-1"
  vpc_id = module.vpc.vpc_id
  ingress_port = 3306
  sources = ["0.0.0.0/0"]
}

module "load-balancer" {
  source = "../../modules/load_balancer"

  inf_env = var.inf_env

  target_id = module.ec2.ec2_id[0]
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.vpc_private_subnet_ids
  security_groups = [module.security-group-tls.sec_gr_id]

  depends_on = [ module.vpc ]
}

module "database" {
  source = "../../modules/rds"

  inf_env = var.inf_env
  vpc_security_group_ids = [module.security-group-db.sec_gr_id]
  subnet_ids = module.vpc.vpc_private_subnet_ids

  username = var.db_username
  password = var.db_password

  depends_on = [ module.vpc ]
}

module "bastion" {
  source = "../../modules/ec2"
  
  inf_env = "${var.inf_env}-bastion"
  ami_key_pair_name = var.ami_key_pair_name

  subnet_id = module.vpc.vpc_public_subnet_ids[0]
  #vpc_default_security_group_id = module.vpc.vpc_default_security_group_id 
  other_security_groups = [module.security-group-tls.sec_gr_id]
}

module "eks" {
  source = "../../modules/eks"

  inf_env = "${var.inf_env}"

  cluster_subnet_ids = module.vpc.vpc_private_subnet_ids
  nodegr_subnet_ids = module.vpc.vpc_private_subnet_ids
  assume_role_policy = file(var.eks_role_policy_path)

  depends_on = [ module.vpc ]
}
