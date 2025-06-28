
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

# provider "aws" {
#   region = "us-east-1"  # Replace with the region you want to use
#   access_key = 
#   secret_key = 
# }

# Example resource (AWS EC2 instance)
resource "aws_instance" "example" {
  ami           = "ami-05ffe3c48a9991133"  # Replace with a valid AMI ID
  instance_type = "t2.micro"
}
