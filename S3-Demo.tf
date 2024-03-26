provider "aws" {
  region = "us-west-2" # Change this to your desired region
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "prisma-bucket-69" # Change this to your desired bucket name
  #acl    = "private"      # Grant public read access to the bucket

  tags = {
    Name = "demo Bucket"
  }
}

resource "aws_s3_bucket_policy" "demo_bucket_policy" {
  bucket = aws_s3_bucket.demo_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "s3:GetObject",
      Resource  = aws_s3_bucket.demo_bucket.arn
    }]
  })
}
