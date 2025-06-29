##  Definition
Provisioners in Terraform are used to execute scripts or commands on a local machine or remote resource after it is created or destroyed.

They help with bootstrapping, configuration, or custom actions that can't be done via standard Terraform resources.

🧠 In Layman Terms:
Imagine you create a virtual machine (EC2 instance) using Terraform.
But now you want to:

Install Nginx

Create a directory

Copy some files

Terraform doesn’t directly do that — but you can use a provisioner to run a shell script after the VM is ready.

🔧 Types of Provisioners
Type	Description
remote-exec	Runs commands on the remote resource (e.g., EC2)
local-exec	Runs commands on your local machine
file	Uploads files from local → remote machine

🧪 Example 1: remote-exec Provisioner
hcl
Copy
Edit
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y"
    ]
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }
}
🧪 Example 2: local-exec Provisioner
hcl
Copy
Edit
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Deployment finished!' >> deploy.log"
  }
}
🧪 Example 3: file Provisioner
hcl
Copy
Edit
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
🔥 When to Use Provisioners
Installing software post-deployment

Copying config files

Bootstrapping a system before configuration management (e.g., Ansible, Chef)

🚫 Best Practice Warning
Avoid using provisioners unless absolutely necessary.

Terraform recommends:

Using cloud-init for bootstrapping

Using configuration management tools (Ansible, Puppet, Chef)

Keeping infrastructure declarative, not imperative

🧠 create vs destroy Provisioners
You can run provisioners:

During creation of a resource (default)

During destruction, by specifying:

hcl
Copy
Edit
provisioner "local-exec" {
  when    = "destroy"
  command = "echo 'VM is being destroyed!'"
}
📌 Provisioners Are Last Resort
They break the idempotent nature of Terraform — i.e., repeated applies may not behave the same.
Use them only if:

No Terraform-native resource/module supports the task

You must run one-time scripts or third-party tools

❓ Interview Questions on Provisioners
Question	What They Expect
What is a provisioner in Terraform?	Describe types (remote-exec, local-exec, file)
When should you use provisioners?	Rare cases, bootstrapping only
What is the problem with using provisioners heavily?	Breaks idempotency, error-prone
What alternatives can you use instead?	cloud-init, user data, Ansible, native Terraform resources
What’s the difference between create and destroy provisioners?	Timing of execution