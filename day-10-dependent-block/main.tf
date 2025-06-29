provider "aws" {
  region = "us-east-1"
}

# Create S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-deepak-bucket-terraform"
}

# Create IAM Role
resource "aws_iam_role" "my_role" {
  name = "my-custom-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# IAM policy attachment that depends on both above
resource "aws_iam_role_policy" "my_policy" {
  name = "my-policy"
  role = aws_iam_role.my_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action   = "s3:*",
      Effect   = "Allow",
      Resource = "${aws_s3_bucket.my_bucket.arn}/*"
    }]
  })

  # Explicit dependency
  depends_on = [
    aws_iam_role.my_role,
    aws_s3_bucket.my_bucket
  ]
}
