
# main.tf
resource "aws_instance" "demo1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  security_groups = [var.security_group]


  tags = {
    Name = var.instance_name
  }

  # optional to associate Elastic IP (EIP)
  associate_public_ip_address = true
}
