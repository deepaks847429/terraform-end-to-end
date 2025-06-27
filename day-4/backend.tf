terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"  # Replace with your S3 bucket name
    key            = "path/to/your/terraform/statefile.tfstate"  # The path to store the state file
    region         = "us-east-1"  # Specify your AWS region
    encrypt        = true  # Enable encryption for your state file
    acl            = "bucket-owner-full-control"  # Give full control to the bucket owner

    # Enable DynamoDB for state locking and consistency
    dynamodb_table = "your-terraform-lock-table"  # Replace with your DynamoDB table name
  }
}
