variable "aws_region" {
  type = string
  description = "AWS Region where infrastructure will be deployed"
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  type = string
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  type = string
  description = "CIDR block for the public subnet"
  default = "10.0.1.0/24"
}

variable "ami" {
  type = string
  description = "AMI ID of the EC2 instance"
  default = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
  type = string
  description = "EC2 instance type (e.g., t2.micro)"
  default = "t2.medium"
}

variable "ssh_key_name" {
  type = string
  description = "Name of the existing SSH key pair"
  default = "new"
}
