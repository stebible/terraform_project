resource "aws_default_security_group" "default-sg" {
  vpc_id = aws_vpc.myapp-vpc.id

  ingress  {
    cidr_blocks = [var.my_ip]
    description = "ssh myapp-server"
    from_port = 22
    protocol = "tcp"
    to_port = 22
  } 
  
  ingress  {
    cidr_blocks = ["0.0.0.0/0"]
    description = "access nginx"
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
  }

  egress  {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    protocol = "-1"
    to_port = 0
    prefix_list_ids = []
  }

    tags = {
    Name: "${var.env_prefix}-default-sg"
  }
}