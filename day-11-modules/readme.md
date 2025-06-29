## file structure to use modules
terraform-modules/
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    └── ec2/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf

## Here are expert-level Terraform module notes tailored for someone with 5+ years of experience, structured to help crack Terraform interviews—from fundamentals to real-world applications and deep-dive concepts.

📘 Terraform Modules — Pro Notes for Interview
🧱 1. What is a Terraform Module?
A Terraform module is a container for multiple resources that are used together.

Every Terraform configuration is a module (called the root module).

A child module is any module that is called by another module.

🔁 2. Why Use Modules?
Benefit	Description
Reusability	Define infrastructure once, use in multiple places (DRY principle)
Maintainability	Changes in one module affect all consumers
Scalability	Manage large infrastructure by splitting into logical units
Collaboration	Teams can build, version, and reuse modules across projects
Consistency	Reduces errors by enforcing naming standards, tagging, etc.

🧩 3. Module Structure (Recommended)
css
Copy
Edit
modules/
└── ec2/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf

environments/
└── prod/
    ├── main.tf
    └── terraform.tfvars
📦 4. Module Sources
Source Type	Example
Local path	source = "./modules/ec2"
GitHub	source = "git::https://github.com/org/mod.git"
Terraform Registry	source = "terraform-aws-modules/vpc/aws"

You can also pin versions from Git tags or commit SHAs.

🧠 5. Best Practices
✅ Define variables.tf, outputs.tf, and main.tf in all modules
✅ Use version constraints when pulling from registries
✅ Keep modules small and focused (1 module = 1 responsibility)
✅ Avoid hardcoding — use variables
✅ Always output critical values (like resource IDs, ARNs)
✅ Use depends_on sparingly and only when Terraform can’t auto-detect dependencies
✅ Enable terraform-docs for auto-generating module docs

🧪 6. Testing Terraform Modules
Use tools like:

terraform validate

tflint

terratest

kitchen-terraform

Separate module testing from environment testing

🧮 7. Input Validation & Defaults
Use validation blocks to enforce input quality:

hcl
Copy
Edit
variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 type"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Only t2.micro and t3.micro are allowed"
  }
}
🪢 8. Managing Complex Modules
Use Module Composition

Use for_each or count in modules to support dynamic creation

Externalize environment-specific values using .tfvars

Prefer locals inside modules for computed values

Handle provider configurations carefully if multiple providers are used

📤 9. Outputs in Modules
Use output values to expose internal resources:

h
Copy
Edit
output "instance_id" {
  value = aws_instance.example.id
}
Consume it:

hcl
Copy
Edit
output "ec2_id" {
  value = module.ec2.instance_id
}
🔐 10. Private Module Registry (Enterprise)
Terraform Cloud & Enterprise support private registries

Use terraform login and source = "<hostname>/<namespace>/<name>/<provider>"

❓ Top Interview Questions on Terraform Modules
Level	Sample Question
Basic	What is a Terraform module? How do you use one?
Intermediate	How do you pass values to a module? How do you handle environment-specific variables?
Advanced	How do you test and version control a Terraform module used across multiple teams?
Expert	How do you design a scalable module for dynamic VPC + subnets creation with multiple environments?
Real-world	What are the trade-offs between local modules, Git-based modules, and Registry modules?

💬 Bonus: Real-World Use Cases
Multi-Region VPC Setup: One module reused with var.region

Multi-Tier Application Infra: Separate modules for network, DB, backend, frontend

CI/CD Integration: Terraform modules triggered from GitHub Actions or Jenkins pipelines
