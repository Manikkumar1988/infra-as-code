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

variable "db_name" {
  type        = string
  description = "db_name"
}

variable "db_username" {
  type        = string
  description = "db_username"
}

variable "db_secret_arn" {
  type        = string
  description = "db_secret_arn"
}

variable "db_secret_key_id" {
  type        = string
  description = "db_secret_key_id"
}

variable "db_address" {
  type        = string
  description = "db_address"
}