#! /bin/bash
sudo yum update
sudo hostnamectl set-hostname terraform-demo
sudo su - ec2-user
wget https://dlcdn.apache.org/maven/maven-3/3.9.0/binaries/apache-maven-3.9.0-bin.zip
