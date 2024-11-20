provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "aws_practica_cloud" {
  name = "server-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "practica_cloud_server" {
  ami                    = "ami-02bcbb802e03574ba"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.aws_practica_cloud.id}"]
  key_name               = "practica-cloud"
}

output "serverIp" {
  value = "${aws_instance.practica_cloud_server.public_ip}"
}
