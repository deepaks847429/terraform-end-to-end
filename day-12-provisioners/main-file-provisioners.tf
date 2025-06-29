resource "aws_instance" "web" {
  # ... instance details ...

  provisioner "file" {
    source      = "app_config.txt"
    destination = "/home/ubuntu/app_config.txt"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
}
