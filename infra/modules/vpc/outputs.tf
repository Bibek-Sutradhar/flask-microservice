output "vpc-id" {
  value = aws_vpc.vpc.id
}

output "vpc-cidr-block" {
  value = aws_vpc.vpc.cidr_block
}

output "igw-id" {
  value = aws_internet_gateway.igw.id
}

output "pub-subnet-a-id" {
  value = aws_subnet.public-subnet-a.id
}

output "priv-subnet-a-id" {
  value = aws_subnet.private-subnet-a.id
}

output "pub-subnet-a-cidr-block" {
  value = aws_subnet.public-subnet-a.cidr_block
}

output "priv-subnet-cidr-block" {
  value = aws_subnet.private-subnet-a.cidr_block
}

output "pub-subnet-b-id" {
  value = aws_subnet.public-subnet-b.id
}

output "pub-subnet-b-cidr-block" {
  value = aws_subnet.public-subnet-b.cidr_block
}