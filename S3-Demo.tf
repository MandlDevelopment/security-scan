provider "aws" {
  region = "us-west-2" # Change this to your desired region
}

resource "aws_s3_bucket" "sample_bucket" {
  bucket = "prisma-bucket" # Change this to your desired bucket name
  #acl    = "private"      # Grant public read access to the bucket

  tags = {
    Name = "sample Bucket"
  }
}

resource "aws_s3_bucket_policy" "example_bucket_policy" {
  bucket = aws_s3_bucket.sample_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "s3:GetObject",
      Resource  = aws_s3_bucket.sample_bucket.arn
    }]
  })
}
