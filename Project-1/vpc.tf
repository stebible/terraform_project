

resource "aws_vpc" "FirstVPC" {
  cidr_block = var.cidr_block

 tags = {
  "Name" = "myvpc" 
 }
}

resource "aws_instance" "ec2_demo" {
  ami = data.aws_ami.my_amiredhat.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  security_groups = [aws_security_group.web-traffic.name]
  tags = {
    "Name" = "myapp_server"
  }
}

output "ec2_demo" {
  description = "ec2 instance Plublic IP"
  value = aws_instance.ec2_demo.public_ip
}