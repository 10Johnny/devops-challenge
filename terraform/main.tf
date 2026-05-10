terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source      = "./modules/networking"
  project     = var.project
  environment = var.environment
}

module "ecr" {
  source      = "./modules/ecr"
  project     = var.project
  environment = var.environment
}

module "ecs" {
  source                = "./modules/ecs"
  project               = var.project
  environment           = var.environment
  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  security_group_id     = module.networking.ecs_security_group_id
  alb_security_group_id = module.networking.alb_security_group_id
  ecr_repo_url          = module.ecr.repository_url
  aws_region            = var.aws_region
}

module "monitoring" {
  source      = "./modules/monitoring"
  project     = var.project
  environment = var.environment
}
