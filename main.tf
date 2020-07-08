provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "docker" {
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "docker" {
  description = "Docker AMI"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  egress {
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  egress {
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }
}

resource "aws_instance" "docker" {
  ami                         = var.base_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.docker.id]
  key_name                    = aws_key_pair.docker.key_name
  associate_public_ip_address = true
}

data "template_file" "inventory" {
  template = file("${path.module}/inventory.tpl")

  vars = {
    public_ip   = aws_instance.docker.public_ip
    instance_id = aws_instance.docker.id
    aws_region  = var.aws_region
  }
}

resource "local_file" "inventory" {
  content  = data.template_file.inventory.rendered
  filename = "${path.module}/inventory"
}
