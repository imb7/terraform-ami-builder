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
  default = "137112412989"
}

variable "ami_name_pattern" {
  description = "filter for AMI name pattern, e.g., amzn2-ami-hvm-*-x86_64-gp2 for amazon linux 2 and ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-* for ubuntu 22.04"
  type        = string
  default = "amzn2-ami-hvm-*-x86_64-gp2"
}


####--- common ec2-image-builder variables ---####
variable "instance_types" {
  description = "List of EC2 instance types to use for building and testing the image. E.g., [\"c5.large\"]"
  type        = list(string)
  default     = ["t3.medium", "c5.large"]
}


####--- web-ec2-image-builder variables ---####
variable "ami_name" {
  description = "name for your custome AMI"
  type = string
  default = "web-tier-${data.aws_ami.aws_base_image.name}"
}

variable "ami_description" {
  description = "description for your custome AMI"
  type = string
  default = "An AMI for web tier servers, built with EC2 Image Builder"
}