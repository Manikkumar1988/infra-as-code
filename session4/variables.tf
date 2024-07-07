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

variable "number_of_public_subnets" {
  type        = number
  description = "public subnet"
  default     = 2
}

variable "number_of_private_subnets" {
  type        = number
  description = "private subnet"
  default     = 2
}

variable "number_of_secure_subnets" {
  type        = number
  description = "secure subnet"
  default     = 2
}