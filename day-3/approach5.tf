# Why: The state file may contain sensitive information (e.g., passwords, secret keys), so it’s important to protect it from unauthorized access.

# Encryption: Use encryption for remote storage (e.g., S3 encryption).

# Access Control: Use IAM roles/policies for controlling who can read/write the state file.

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "path/to/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true # Ensures the state file is encrypted
    dynamodb_table = "terraform-state-lock"
  }
}
