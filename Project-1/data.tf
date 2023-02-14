data "aws_ami" "my_amiredhat" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["RHEL-9.0.0_HVM-*-24-Hourly2-GP2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
    filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
