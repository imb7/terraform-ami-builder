####--- General Variables ---####
variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project for tagging resources"
  type        = string
  default     = "imageBuilderProject"
}

variable "environment" {
  description = "The environment for tagging resources (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "The owner of the resources for tagging purposes"
  type        = string
  default     = "ibrahim"
}

####--- data block variables ---####

variable "ami_owner" {
  description = "filter for AMI owner, e.g., 137112412989 or amazon for amazo-linux and 099720109477 or canonical for ubuntu"
  type        = string
}

variable "ami_name_pattern" {
  description = "filter for AMI name pattern, e.g., amzn2-ami-hvm-*-x86_64-gp2 for amazon linux 2 and ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-* for ubuntu 22.04"
  type        = string
}