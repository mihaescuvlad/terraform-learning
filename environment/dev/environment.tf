module "vpc" {
  source = "../../modules/vpc"

  inf_env = var.inf_env

  public_subnets = local.public_subnets
  private_subnets = local.private_subnets
}

module "ec2" {
  source = "../../modules/ec2"

  inf_env = var.inf_env
 
  subnet_id = module.vpc.vpc_private_subnet_ids[0] 
  vpc_default_security_group_id = module.vpc.vpc_default_security_group_id

  user_data = file("../../modules/ec2/user-data/ec2-nginx-webserver.sh")
}

module "security-group-tls" {
  source = "../../modules/security_groups"

  vpc_id = module.vpc.vpc_id
  private_subnets = local.private_subnets
}

module "bastion" {
  source = "../../modules/ec2"
  
  inf_env = "${var.inf_env}-bastion"
  ami_key_pair_name = "teste-puternice"

  subnet_id = module.vpc.vpc_public_subnet_ids[0]
  vpc_default_security_group_id = module.vpc.vpc_default_security_group_id
  other_security_groups = [module.security-group-tls.sec_gr_id]
}
