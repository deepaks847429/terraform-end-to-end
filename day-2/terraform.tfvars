# terraform.tfvars
aws_region      = "us-east-1"
ami_id          = "ami-0c55b159cbfafe1f0"   # Example AMI ID, replace with the actual one you want
instance_type   = "t2.micro"
key_name        = "your-ec2-keypair"
subnet_id       = "subnet-xxxxxxxx"
security_group  = "sg-xxxxxxxx"
instance_name   = "MyEC2Instance"
