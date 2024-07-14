variable "prefix" {
  type        = string
  description = "resource prefix"
}

variable "region" {
  type        = string
  description = "aws region"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_subnet_ids" {
  type        = list
  description = "private_subnet_ids"
}

variable "alb_target_group_arn" {
  type        = string
  description = "alb_target_group_arn"
}

variable "alb_security_group_id" {
  type        = string
  description = "alb_security_group_id"
}