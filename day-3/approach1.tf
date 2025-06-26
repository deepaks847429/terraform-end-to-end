terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key = "terraform/state"
    region = "us-east-1"
    dynamodb_table = "value"
    encrypt = true
  }
}

#This ensures:
#Versioning of the state file using S3.
#State locking using DynamoDB to prevent concurrent modifications.
#Encryption for securing sensitive data.