output "s3_bucket" {
  description = "The S3 bucket name where the Terraform state file is stored"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table" {
  description = "The DynamoDB table used for state locking"
  value       = aws_dynamodb_table.terraform_lock.name
}
