# suppose i want to delete some file in ec2 instance, how to do that?
resource "null_resource" "delete_file" {
  depends_on = [aws_instance.example]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.example.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Deleting file...'",
      "sudo rm -f /home/ubuntu/old-script.sh",
      "echo 'File deleted.'"
    ]
  }
}
