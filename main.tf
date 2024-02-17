provider "aws" {
  region = "eu-north-1"
}


module "vpc" {
  source                       = "./module/vpc"
  cidr_block                   = var.cidr_block
  project                      = var.project1
  publi_cidr_block             = var.publi_cidr_block
  private_cidr_block           = var.private_cidr_block
  route_destination_cidr_block = var.route_destination_cidr_block
  private_route_t_cidr_block   = var.private_route_t_cidr_block
  sc_cidr_ipv4                 = var.sc_cidr_ipv4
  from_port                    = var.from_port
  to_port                      = var.to_port
}

module "instance" {
  source            = "./module/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  project           = var.project1
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
  aws_instance      = module.instance.aws_instance
}

module "lb" {
        source = "./module/lb"
	subnets = ["module.vpc.subnet_id"]
	vpc_id = module.vpc.aws_vpc
	cidr_ipv4 = var.cidr_block 
	target_id = module.instance.aws_instance
}
