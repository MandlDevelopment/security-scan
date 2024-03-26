provider "aws" {
  region = "us-west-2"  # Change this to your desired region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "bucket-6970"  # Change this to your desired bucket name

  acl    = "public-read"  # Grant public read access to the bucket

  tags = {
    Name = "Example Bucket"
  }
}
