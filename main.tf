provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ros_server" {
  ami           = "ami-12345678" # Replace with Ubuntu 20.04 LTS AMI ID
  instance_type = "t2.micro"
  key_name      = "your-key"
  security_groups = ["default"]

  tags = {
    Name = "ROS-Server"
  }
}
