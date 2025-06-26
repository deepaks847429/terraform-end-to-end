# Why: You can use workspaces to manage multiple environments (e.g., dev, staging, production) without the need for separate state files for each.

# How: Use terraform workspace to create and manage different environments.

terraform workspace new dev
terraform workspace select dev


terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "envs/${terraform.workspace}/terraform.tfstate"
    region = "us-east-1"
  }
}
