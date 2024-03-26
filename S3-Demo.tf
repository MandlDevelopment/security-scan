provider aws {
  region = us-west-2  # Specify your AWS region
}

resource aws_s3_bucket my_bucket {
  bucket = my-unique-bucket-name  # Ensure this name is unique
  acl    = private

  tags = {
    Name        = Prisma Demo
    Environment = Dev
  }
}