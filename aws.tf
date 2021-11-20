terraform {
 backend "remote" {
    organization = "Terraform-prime"

    workspaces {
      name = "terraform-prime-one"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.65.0"
    }
  }
}


locals {
  project_name = "Terraproject"
}


resource "aws_instance" "my_server" {
  ami           = "ami-04ad2567c9e3d7893"
  instance_type = var.instance_type 

  tags = {
    Name = "myserver-${local.project_name}"
  }
}

/*
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc-anton"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
*/
