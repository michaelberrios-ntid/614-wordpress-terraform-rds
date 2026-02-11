# Provider Configuration
# Specifies the AWS provider and region for Terraform to manage resources in.
provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "networking" {
  source  = "./modules/networking"
  vpc_id  = module.vpc.vpc_id
}

module "security" {
  source  = "./modules/security"
  vpc_id  = module.vpc.vpc_id
}

module "instances" {
  source                  = "./modules/instances"
  instance_type           = var.instance_type
  subnet_id               = module.networking.subnet_ids[0]
  vpc_security_group_ids  = [module.security.web_sg_id]
  key_name                = var.key_name
  user_data               = module.wordpress.user_data
}

module "database" {
  source  = "./modules/database"

  db_name                 = var.db_name
  username                = var.username
  password                = var.password

  subnet_ids              = module.networking.subnet_ids
  vpc_security_group_ids  = [module.security.db_sg_id]
}

module "wordpress" {
  source = "./modules/wordpress"

  db_name   = var.db_name
  username  = var.username
  password  = var.password
  endpoint  = module.database.rds_endpoint
}