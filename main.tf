module "networking" {
  source = "./networking"
}

module "security_group" {
    source = "./security_group"
    vpc_id = module.networking.vpc_id
}

module "ec2" {
    source = "./ec2"
    sg_group_id = module.security_group.sg_group_id
    vpc_subnet_id = module.networking.pointhub_public_subnet_id
}