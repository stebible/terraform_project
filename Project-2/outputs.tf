output "aws_ami-id" {
  value = data.aws_ami.latest-amazon-linux-image.id
}

output "ec2_public-ip" {
  value = aws_instance.myapp-server.public.ip
}