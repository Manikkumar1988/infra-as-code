variable "prefix" {
  type        = string
  description = "resource prefix"
}

variable "region" {
  type        = string
  description = "aws region"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "subnet1_cidr" {
  type        = string
  description = "public subnet"
}

variable "subnet2_cidr" {
  type        = string
  description = "public subnet"
}


variable "subnet3_cidr" {
  type        = string
  description = "private subnet"
}


variable "subnet4_cidr" {
  type        = string
  description = "private subnet"
}

variable "subnet5_cidr" {
  type        = string
  description = "secure subnet"
}


variable "subnet6_cidr" {
  type        = string
  description = "secure subnet"
}