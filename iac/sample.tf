resource "aws_vpc" "vpc-1234567890abcdef0" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "vpc-0987654321abcdef0" {
  cidr_block = "192.168.0.0/16"
}

