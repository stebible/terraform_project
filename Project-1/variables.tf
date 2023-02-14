variable "my_ami" {
  description = "was ami"
  type = string
  default = "ami-0521a1ab6cb98215d"
}

variable "region" {
  description = "aws region"
  type = string
  default = "us-east-2"
}

variable "instance_type" {
  description = "aws instance_type"
  type = string
  default = "t2.micro"
}

variable "cidr_block" {
  description = "aws cidr_block"
  type = string
  default = "192.168.0.0/24"
}

