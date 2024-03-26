provider "aws" {
  region = "us-east-1" # Choose your AWS region
}

resource "aws_s3_bucket" "data" {
  # bucket is public
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "Bucket360"
  tags = {
    Name        = "Bucket360"
    yor_trace   = "db7dfc12-0e81-4091-8b21-e8817dceae28"
    Environment = "Dev"
    yor_name    = "data"
  }
    }, 

  )
}
