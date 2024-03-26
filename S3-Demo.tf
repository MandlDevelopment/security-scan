provider "aws" {
  region = "us-east-1" # Choose your AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "bucket6971" # Ensure this is unique
  acl    = "public-read" # Defines the access control level

  tags = {
    Name        = "My Terraform S3 Bucket"
    Environment = "Dev"
  }
}
