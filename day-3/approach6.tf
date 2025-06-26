#Why: The state file may contain sensitive data, and keeping it in version control can expose your secrets.

#How: Always add the state file to .gitignore.

# .gitignore
# This file should be in the root of your Terraform project directory to ensure that the state file

terraform.tfstate
terraform.tfstate.backup
.terraform/
