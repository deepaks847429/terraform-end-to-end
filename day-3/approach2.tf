# state file versioning is crucial for tracking changes and rolling back if necessary.
#Versioning is automatically enabled when using S3. This allows you to access older versions of your state file if something goes wrong.

terraform {
  backend "s3"{
    bucket= "your-terraform-state-bucket"
    key= "terraform/state"
    region= "us-east-1"
    dynamodb_table = "value"
    encrypt = true
    versioning=true
  }
}