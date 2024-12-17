terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.16"
        }
    }
    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-1"
}

module "my_vpc" {
  source = "./modules/my_vpc"
}
module "securityGroups" {
  source = "./modules/securityGroups"
}
module "instances" {
    source = "./modules/instances"
}
module "output" {
  source = "./modules/outputs"
}