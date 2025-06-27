# Configure AWS provider
provider "aws" {
  region = var.region
}

# Create an S3 bucket for storing state files
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  acl    = "private"
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with your AMI ID
  instance_type = "t2.micro"
}

# Create a DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name           = var.dynamodb_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
