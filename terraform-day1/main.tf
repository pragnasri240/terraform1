resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terra-vpc"
  }
}
resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "subnet-1"
  }
}
resource "aws_subnet" "subnet-2" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "subnet-2"
  }
}