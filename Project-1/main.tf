resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default1"
 tags = {
  "Name" = "mmain" 
 }
}

provider "aws" {
    region = "us-east-2"
    profile = "default"
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default1"
 tags = {
  "Name" = "myvpc" 
 }
}

resource "aws_subnet" "Public_sb" {
  cidr_block = "10.0.0.1/24"
  tags = {
    "Name" = "myvpc_publicsb"
  }
  
}
resource "aws_instance" "ec2_demo" {
  ami = ""
  instance_type = "t2.micro"
  tags = {
    "Name" = "myapp_server"
  }
}