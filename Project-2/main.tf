provider "aws" {
  region = "us-east-2"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}


resource "aws_vpc" "development" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name : "development",
    vpc_env: "dev"
  }
}

resource "aws_subnet" "dev-subenet-1" {
  vpc_id = aws_vpc.development.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "us-east-2a"
  tags = {
    Name : "sub-dev-1"
  }
}


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }
  tags = {
    Name: "${var.env_prefix}-rtb"
  }
  
output "dev-sub-1" {
  value = aws_subnet.dev-subenet-1.id
}