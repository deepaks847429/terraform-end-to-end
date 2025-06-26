variable "aws_region"{
  description = "value of aws region"
  type = string
  default= "us-east-1"
}

variable "ami_id"{
  description= "AMI id for the instance"
  type=string
  default= "ami-0c55b159cbfafe1f0"  # Example AMI ID, replace with the actual one you want
}

variable "instance_type"{
  description = "value of instance type"
  type= string
  default = "t2.micro"
}

variable "key_name"{
  description = "value of key name"
  type = string
  default = "your-ec2-keypair"
}

variable "subnet_id"{
  description = "value of subnet id"
  type = string
  default = "subnet-xxxxxxxx"  
}

variable "security_group"{
  description = "value of security group"
  type = string
  default = "sg-xxxxxxxx"
}

variable "instance_name"{
  description = "value of instance name"
  type = string
  default = "MyEC2Instance"
}

