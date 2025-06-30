# Want to update my ec2 instance after creation using 'sudo apt update' command and below is the code to do that
provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")  # Your public SSH key
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Ubuntu AMI (replace if needed)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "MyEC2"
  }
}

resource "null_resource" "remote_update" {
  depends_on = [aws_instance.example]

  connection {
    type        = "ssh"
    user        = "ubuntu"  # Depends on AMI; might be "ec2-user" for Amazon Linux
    private_key = file("~/.ssh/id_rsa")  # Path to your private key
    host        = aws_instance.example.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt upgrade -y"
    ]
  }
}
