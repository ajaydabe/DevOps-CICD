resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "My VPC"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_route_table" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_instance" "webserver" {
  count = 4
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.webserver.id]
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "Web Server ${count.index + 1}"
  }
}

resource "aws_security_group" "webserver" {
  name = "webserver-sg"
  description = "Security group for web servers"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
