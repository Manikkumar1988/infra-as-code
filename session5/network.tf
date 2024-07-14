data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.prefix}-vpc"
  cidr = var.vpc_cidr

  azs = [data.aws_availability_zones.available.names[0],data.aws_availability_zones.available.names[1]]

  private_subnets  = ["192.168.1.32/28", "192.168.1.48/28"]
  public_subnets   = ["192.168.1.0/28", "192.168.1.16/28"]

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  create_igw            = true

  public_subnet_names   = ["${var.prefix}-public-subnet-1", "${var.prefix}-public-subnet-2"]
  private_subnet_names  = ["${var.prefix}-private-subnet-1", "${var.prefix}-private-subnet-2"]
}