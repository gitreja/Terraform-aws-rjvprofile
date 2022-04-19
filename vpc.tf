module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = var.VPC_NAME
  cidr                 = var.VPC-CIDR
  azs                  = [var.ZONE1, var.ZONE2, var.ZONE3]
  private_subnets      = [var.VPC-PriSub1-CIDR, var.VPC-PriSub2-CIDR, var.VPC-PriSub3-CIDR]
  public_subnets       = [var.VPC-PubSub1-CIDR, var.VPC-PubSub2-CIDR, var.VPC-PubSub3-CIDR]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }

  vpc_tags = {
    Name = var.VPC_NAME
  }
}


