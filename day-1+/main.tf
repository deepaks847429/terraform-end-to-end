resource "aws-instance" "name"{
  ami= "ami-12345678"
  instance_type = "t2.micro"
  key-name = "my-key-pair"
}