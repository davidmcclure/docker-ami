variable "aws_region" {
  default = "us-east-1"
}

variable "aws_availability_zone" {
  default = "us-east-1a"
}

variable "base_ami" {
  default     = "ami-0ac80df6eff0e70b5"
  description = "Ubuntu 18"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_key_path" {
  type = string
}