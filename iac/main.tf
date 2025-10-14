# Minimal misconfigured tf file
terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket         = "mandl-unique-terraform-state-bucket-12345" # Must be globally unique
    key            = "environments/production/terraform.tfstate" # Path to the state file
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-locks" # Used for state locking
    encrypt        = true                    # State file encryption
    # DO NOT use variables (like var.region) in the backend block
  }}
provider "aws" {
  region = "eu-west-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name      = "example-instance"
    yor_trace = "adba60cf-5446-44b1-bd60-9f9d628fd348"
  }
}
output "public_ip" {
  value = aws_instance.example.public_ip
}
