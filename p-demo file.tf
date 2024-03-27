# Define the provider and version
provider "aws" {
  region  = "us-east-1" # You can change this to your desired AWS region
  version = "~> 3.0"    # Specifies the version of the AWS provider you want to use
}

#create a new S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "bucket6960" # Ensure this is unique
  acl    = "private" # Defines the access control level

  tags = {
    Name        = "My Terraform S3 Bucket"
    yor_trace =   "db7dfc12-0e81-4091-8b21-e8817dceae28"
    Environment = "Dev"
  }
}

# Create a new instance of the VPC resource
resource "aws_vpc" "my_vpc" {
  # checkov:skip=CKV2_AWS_11: ADD REASON
  cidr_block = "10.0.0.0/16"
 
  tags = {
    Name      = "my-vpc"
    yor_trace = "db7dfc12-0e81-4091-8b21-e8817dceae26"
  }
}

# Create an internet gateway for the VPC
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name      = "my-internet-gateway"
    yor_trace = "2869f193-80c8-4e96-a7a3-4b3d37b4b1aa"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name      = "my-subnet"
    yor_trace = "5cd40a7a-e89b-4f4d-9ffc-607ec34087d9"
  }
}

# Specify an AWS EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0c101f26f147fa7fd" # Example AMI ID, you should use an AMI ID that matches your requirements
  instance_type = "t3.micro"              # Specifies the instance type

  subnet_id = aws_subnet.my_subnet.id # Associates the instance with the subnet

  tags = {
    Name      = "MyInstance"
    yor_trace = "b72ab96c-6742-4085-9d93-eadf26998f77"
  }
}