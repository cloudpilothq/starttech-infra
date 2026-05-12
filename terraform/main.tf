terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source               = "./modules/networking"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  environment          = var.environment
  project_name         = var.project_name
}

module "compute" {
  source              = "./modules/compute"
  vpc_id              = module.networking.vpc_id
  public_subnet_ids   = module.networking.public_subnet_ids
  private_subnet_ids  = module.networking.private_subnet_ids
  instance_type       = var.instance_type
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  environment         = var.environment
  project_name        = var.project_name
}

module "storage" {
  source              = "./modules/storage"
  vpc_id              = module.networking.vpc_id
  private_subnet_ids  = module.networking.private_subnet_ids
  environment         = var.environment
  project_name        = var.project_name
}

module "monitoring" {
  source              = "./modules/monitoring"
  environment         = var.environment
  project_name        = var.project_name
  alb_arn_suffix      = module.compute.alb_arn_suffix
  tg_arn_suffix       = module.compute.tg_arn_suffix
}
