provider "aws" {
    region = "us-east-2"
    profile = "default"
}


resource "aws_vpc" "FirstVPC" {
  cidr_block = "192.168.0.0/24"
  instance_tenancy = "default1"
 tags = {
  Name = "myvpc" 
 }
}