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

variable "db_username" {
  type        = string
  description = "Database username"
}

variable "db_name" {
  type        = string
  description = "Database name"
}