provider "aws" {
  region = "us-east-2"
}


data "aws_vpc" "existing_vpc" {
  default = true
}

resource "aws_subnet" "dev-subenet-2" {
  vpc_id = data.aws_vpc.existing_vpc.id
  cidr_block = "10.10.0.0/32"
  availability_zone = "us-east-2b"
  tags = {
     Name = "sub-default"
  }
}