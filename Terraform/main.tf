terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.80"
        }
    }
    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-1"
    profile = "account-tekup" # the profile name in credential file
}

module "my_vpc" {
  source = "./modules/my_vpc"
}
module "securityGroups" {
  source = "./modules/securityGroups"
  vpc_id = module.my_vpc.vpc_id
}
module "instances" {
    source = "./modules/instances"
    security_groups = [module.securityGroups.normalSG_id]
    public_subnetA  = module.my_vpc.public_subnetA
    public_subnetB  = module.my_vpc.public_subnetB
    private_subnetC = module.my_vpc.private_subnetC
    private_subnetD = module.my_vpc.private_subnetD
    private_subnetE = module.my_vpc.private_subnetE
    private_subnetF = module.my_vpc.private_subnetF
}

module "load_balancer" {
  source = "./modules/load_balancer"
  security_groups = [module.securityGroups.normalSG_id]
  vpc_id = module.my_vpc.vpc_id
  public_subnetA  = module.my_vpc.public_subnetA
  public_subnetB  = module.my_vpc.public_subnetB
  frontend_a = module.instances.frontend_a
  frontend_b = module.instances.frontend_b

}
