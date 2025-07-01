provider "aws"{

}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "deepakmerijaan-aayu"
  acl    = "private"

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Development"
  }
}

resource "aws_s3_bucket_object" "my_folder_deepak" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "deepak/"
  content = "This is an example file stored in S3."

  tags = {
    Name        = "Example Object"
    Environment = "Development"
  }
}


output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}