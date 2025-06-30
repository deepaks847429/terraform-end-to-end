resource "null_resource" "config_watcher" {
  triggers = {
    config_file_hash = filemd5("config.json")
  }

  provisioner "local-exec" {
    command = "echo 'Config file changed!'"
  }
}
resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    command = "echo 'Cleaning up resources...'"
  }

  depends_on = [null_resource.config_watcher]
}
#👇What does this mean?
#Every time you run Terraform, it checks if the file config.json changed.

#If yes → it runs the command.

#If not → it skips.

