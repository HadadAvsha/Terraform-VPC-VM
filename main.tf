terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.31.0"
    }
  }
  backend "s3" {
    region = "<aws-bucket-region>"
    bucket = "<bucket-name>"
    key    = "<path/to/key>"
  }
}

provider "aws" {
  default_tags {
    tags = {
      bootcamp   = "15"
      created_by = "Avshalom"
      managed_by = "terraform"
    }
  }
}

module "Network" {
  source              = "./Network"
  public_subnet_cidrs = var.public_subnet_cidrs
  azs                 = var.azs
  prefix              = var.prefix
}
module "Compute" {
  source              = "./Compute"
  instance_name       = var.instance_name
  ssh_key_name        = var.ssh_key_name
  ssh_key_public      = var.ssh_key_public
  SG_id               = module.Network.SG_id
  vpc_id              = module.Network.vpc_id
  prefix              = var.prefix
  subnet_ids          = module.Network.subnet_ids
  subnets_name        = module.Network.subnets_name
  public_subnet_cidrs = var.public_subnet_cidrs
}