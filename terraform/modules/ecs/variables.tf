variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "alb_security_group_id" {
  type = string
}

variable "ecr_repo_url" {
  type = string
}

variable "aws_region" {
  type = string
}
