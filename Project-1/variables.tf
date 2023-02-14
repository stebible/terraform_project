/*variable "my_ami" {
  description = "was ami"
  type = string
  default = "ami-0521a1ab6cb98215d"
}*/

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

variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type = string
  default = "ohio"
}

variable "ingressrules" {
  type = list(number)
  default = [80,443,8080,22]
}

variable "egressrules" {
  type = list(number)
  default = [80,443,25,3306]
}
