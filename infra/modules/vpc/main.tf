#Create VPC
resource "aws_vpc" "vpc" {
    cidr_block       = var.vpc-cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = {
      Name = "${var.project-name}-vpc"
    }
}

#Create Public Subnet 1
resource "aws_subnet" "public-subnet-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-a-cidr
  availability_zone       = var.az-1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project-name}-pub-subnet-a"
  }
}

#Create Public Subnet 2
resource "aws_subnet" "public-subnet-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-b-cidr
  availability_zone       = var.az-2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project-name}-pub-subnet-b"
  }
}

#Create Private Subnet
resource "aws_subnet" "private-subnet-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private-subnet-a-cidr
  availability_zone       = var.az-1
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project-name}-priv-subnet-a"
  }
}

#Create IGW and Route Table for Public Subnet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project-name}-igw"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project-name}-pub-route-table"
  }
}

resource "aws_route" "public-route" {
  gateway_id = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "pub-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-a.id
  route_table_id = aws_route_table.public-route-table.id
}