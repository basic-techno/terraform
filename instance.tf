resource "aws_instance" "webserver1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "${var.ECS_INSTANCE_TYPE}"
  vpc_security_group_ids =["${aws_security_group.allow-ssh.id}"]
  key_name = "${var.KEY_NAME}"
  user_data = "${file("scripts/install_software.sh")}"
  tags = {
    Name = "webserver1"
  }
}


resource "aws_instance" "webserver2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "${var.ECS_INSTANCE_TYPE}"
  vpc_security_group_ids =["${aws_security_group.allow-ssh.id}"]
  key_name = "${var.KEY_NAME}"
  user_data = "${file("scripts/install_software.sh")}"
  tags = {
    Name = "webserver2"
  }
}

resource "aws_security_group" "allow-ssh" {
  name = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}