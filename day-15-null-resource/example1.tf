resource "null_resource" "say_hello" {
  provisioner "local-exec" {
    command = "echo 'Hello! Terraform has finished building!'"
  }
}
resource "null_resource" "create_file" {
  provisioner "local-exec" {
    command = "echo 'This is a file created by Terraform.' > created_file.txt"
  }
}


## 📦 What does this do?
#It doesn't create any AWS or cloud resource.

#It just prints: Hello! Terraform has finished building! on your terminal.

#Think of it like a post-it note with a task you tell Terraform to do.