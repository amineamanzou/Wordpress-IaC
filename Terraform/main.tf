module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source      = "./modules/ec2"
  secg_lb_id  = module.sg.secg_lb_id
  secg_app_id = module.sg.secg_app_id
  secg_db_id  = module.sg.secg_db_id
  secg_ssh_id = module.sg.secg_ssh_id
  subnets     = module.vpc.subnet_ids
}

module "alb" {
  source     = "./modules/alb"
  secg_lb_id = module.sg.secg_lb_id
  subnets    = module.vpc.subnet_ids
  vpc_id     = module.vpc.vpc_id
  instances  = module.ec2.instances
}
