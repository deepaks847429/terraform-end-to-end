provider "aws" {
  region = "us-east-1"
}

module "my_ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  name          = "deepak-server"
}

output "instance_id" {
  value = module.my_ec2.instance_id
}
