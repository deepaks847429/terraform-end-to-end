variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket to store Terraform state"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
}
