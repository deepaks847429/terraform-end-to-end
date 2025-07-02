# Provider setup (this assumes AWS credentials are configured)
provider "aws" {
  region = "us-east-1"  # Set to your AWS region
}

# Create the S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "deepakmerijaan-aayu"
  acl    = "private"

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Development"
  }
}

# resource "aws-instance" "name"{
#   ami= "ami-020cba7c55df1f615"
#   instance_type = "t2.micro"
   
  
# }

# Create an S3 bucket object inside the bucket
resource "aws_s3_bucket_object" "my_folder_deepak" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "deepak/"
  content = "This is an example file stored in S3."

  tags = {
    Name        = "Example Object"
    Environment = "Development"
  }

  depends_on = [aws_s3_bucket.my_bucket]
}

# Create DynamoDB table for state locking, depends on S3 bucket
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock-table"
  hash_key       = "LockID"
  read_capacity  = 1
  write_capacity = 1
  billing_mode   = "PROVISIONED"

  attribute {
    name = "LockID"
    type = "S"
  }

  ttl {
    enabled         = true
    attribute_name  = "ExpirationTime"
  }

  depends_on = [aws_s3_bucket.my_bucket]  # Ensure DynamoDB is created after S3 bucket
}

# Outputs for verifying resources created
output "s3_bucket_name" {
  value       = aws_s3_bucket.my_bucket.bucket
  description = "The name of the S3 bucket"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.my_bucket.arn
  description = "The ARN of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_lock.name
  description = "The name of the DynamoDB table created for state locking"
}

output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.terraform_lock.arn
  description = "The ARN of the DynamoDB table"
}

output "dynamodb_table_stream_arn" {
  value       = aws_dynamodb_table.terraform_lock.stream_arn
  description = "The stream ARN of the DynamoDB table (if enabled)"
}
