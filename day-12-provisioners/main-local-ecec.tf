resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Deployment finished!' >> deploy.log"
  }
}
