
# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "8.0"
#   instance_class       = "db.t3.micro"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql8.0"
#   skip_final_snapshot  = true
# }
provider "aws" {
  #region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_instance" "name" {
  ami           = "ami-05ffe3c48a9991133"  # Replace with your AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
    #ignore_changes        = [tags]
    #replace_triggered_by  = [aws_security_group.example.id]
  }
  
}