
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet1_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.prefix}-public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet27" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet2_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.prefix}-public-subnet-2"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet3_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.prefix}-private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet4_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.prefix}-private-subnet-2"
  }
}

resource "aws_subnet" "secure_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet5_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.prefix}-secure-subnet-1"
  }
}

resource "aws_subnet" "secure_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet6_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.prefix}-secure-subnet-2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.prefix}-igw"
  }
}

resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name = "${var.prefix}-eip"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "${var.prefix}-nat"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "${var.prefix}-private-rt"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.prefix}-public-rt"
  }
}


resource "aws_route_table_association" "public_asso_subnet_1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "public_asso_subnet_2" {
  subnet_id      = aws_subnet.public_subnet27.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_asso_subnet_1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_rt.id
}


resource "aws_route_table_association" "private_asso_subnet_2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_rt.id
}

moved {
  from = aws_subnet.public_subnet2
  to = aws_subnet.public_subnet27
}

import {
  to = aws_subnet.public_subnet
  id = "subnet-02d29f053467db582"
}


resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.168.1.96/28"
  tags = {
    Name = "mk-iac-lab-console-created"
  }
}

