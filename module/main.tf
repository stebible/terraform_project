provider "aws" {
  region = "us-east-2"
}

/*resource "aws_route_table" "myapp-route-table" {
  vpc_id = aws_vpc.myapp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }
  tags = {
    Name: "${var.env_prefix}-rtb"
  }
  
}

resource "aws_route_table_association" "a-rbt-subnet" {
  subnet_id = aws_subnet.myapp-subenet-1.id
  route_table_id = aws_route_table.myapp-route-table.id
}

resource "aws_security_group" "myapp-sg" {
  name = "myapp-sg"
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
    description = "access ngnix"
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
    Name: "${var.env_prefix}-sg"
  }
}*/

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

resource "aws_key_pair" "ssh-key" {
  key_name = "server-key"
  public_key = "file(var.public_key_location)"
  
}



data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true 
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-*-x86_64-gp2"]
  }
    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}




resource "aws_instance" "myapp-server" {
  ami = data.aws_ami.latest-amazon-linux-image.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.myapp-subenet-1.id
  vpc_security_group_ids = [aws_default_security_group.default-sg.id]
  availability_zone = var.avail_zone

  associate_public_ip_address = true
  key_name = aws_key_pair.ssh-key.key_name

  user_data = file("entry-script.sh")

    tags = {
    Name: "${var.env_prefix}-server"
  }
}
