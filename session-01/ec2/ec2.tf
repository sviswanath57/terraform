resource "aws_instance" "web" {
  ami = var.ec2-ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all_terraform.id]
    tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "allow_all_terraform" { # this name is only for terraform
  name = "allow_all_aws" # this is used/reflect in aws end
  description = "Allow TLS inbound traffic"
  #vpc_id = aws_vpc.main.id

  ingress {
    description      = var.sg-description
    from_port        = var.inbound-from-port
    to_port          = 0
    protocol         = var.ec2-protocol
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all_aws"
  }
}