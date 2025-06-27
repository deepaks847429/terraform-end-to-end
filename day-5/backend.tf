terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"  # Replace with your S3 bucket name
    key            = "path/to/terraform/statefile.tfstate"  # Specify a path within the bucket for the state file
    region         = "us-east-1"  # Specify your AWS region
    encrypt        = true         # Encrypt the state file
    acl            = "bucket-owner-full-control"  # Control access to the bucket

    dynamodb_table = "terraform-lock-table"  # DynamoDB table for state locking
  }
}
