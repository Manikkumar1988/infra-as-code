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