# Data Source for dev environment variables where we are using default vpc and subnets for image builder infrastructure. You can modify this to use specific vpc and subnets if needed.

data "aws_region" "current_region" {
}

data "aws_vpc" "default-vpc" {
  default = true
}

data "aws_subnet_ids" "default-subnets" {
  vpc_id = data.aws_vpc.default-vpc.id
}