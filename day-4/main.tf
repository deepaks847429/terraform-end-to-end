# Configure AWS provider
provider "aws" {
  region = "us-east-1"  # Specify your AWS region
}

# Create the S3 bucket for state storage
resource "aws_s3_bucket" "terraform_state" {
  bucket = "your-terraform-state-bucket"  # Replace with your S3 bucket name
  acl    = "private"
}

# Create the DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "your-terraform-lock-table"  # Replace with your table name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# Example resource for testing (e.g., an S3 bucket)
resource "aws_s3_bucket_object" "example" {
  bucket = aws_s3_bucket.terraform_state.bucket
  key    = "example-object.txt"
  content = "This is an example object"
}
