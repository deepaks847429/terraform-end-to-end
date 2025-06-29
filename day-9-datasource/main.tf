# Configure AWS Provider
provider "aws" {
   
}

# Fetch details of an existing IAM user
data "aws_iam_user" "existing_user" {
  user_name = "deepak-devops"  
}

# Outputs
output "iam_user_arn" {
  value       = data.aws_iam_user.existing_user.arn
  description = "ARN of the existing IAM User"
}

output "iam_user_id" {
  value       = data.aws_iam_user.existing_user.user_id
  description = "Unique ID of the existing IAM User"
}

output "iam_user_path" {
  value       = data.aws_iam_user.existing_user.path
  description = "Path of the IAM User"
}


output "iam_user_tags" {
  value       = data.aws_iam_user.existing_user.tags
  description = "Tags associated with IAM User"
}
