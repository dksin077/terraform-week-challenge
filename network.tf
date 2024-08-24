# create internet gateway
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "gateway"
  }
}
# create internet facing route table 
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gateway.id}"
  }
  tags = {
    Name = "route_table" 
  }
}
# create vpc
resource "aws_vpc" "vpc" {
      cidr_block = "10.0.0.0/16"
    tags = {
    Name = "vpc"
  }
}
# create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "public_subnet"
  }
  map_public_ip_on_launch = true
}
# create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "private_subnet"
  }
 }
# subnet associate with route table
resource "aws_route_table_association" "associate_route" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
} 
