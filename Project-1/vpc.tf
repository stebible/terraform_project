

resource "aws_vpc" "FirstVPC" {
  cidr_block = var.cidr_block

 tags = {
  "Name" = "myvpc" 
 }
}

resource "aws_instance" "ec2_demo" {
  ami = var.my_ami
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "myapp_server"
  }
}

