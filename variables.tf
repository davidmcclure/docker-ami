variable "name" {
  default = "docker"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_availability_zone" {
  default = "us-east-1a"
}

variable "base_ami" {
  default     = "ami-0a313d6098716f372"
  description = "Ubuntu 18"
}

variable "instance_type" {
  default = "t2.micro"
}
