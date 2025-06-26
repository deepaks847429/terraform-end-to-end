# Enable State Locking for Safety
# Why: Multiple users working with the same state file can lead to conflicting changes. State locking ensures only one      process can modify the state at a time.

# How: Configure state locking when using remote backends. For example, DynamoDB can be used for locking in AWS.

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "path/to/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"  # Locks the state while being updated
    encrypt        = true
  }
}
