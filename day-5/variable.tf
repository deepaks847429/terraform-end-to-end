variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket to store Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
}
variable "s3_key" {
  description = "The path to store the state file in the S3 bucket"
  type        = string
  default     = "path/to/your/terraform/statefile.tfstate"
}