### What is output in Terraform?
In Terraform, output is a block that allows you to expose data from your Terraform configurations to be used after a successful terraform apply operation. Outputs can help you pass information from one Terraform module or resource to another or display useful information about the infrastructure you've provisioned.

Use Cases of output in Terraform
Exposing Resource Information:

After creating resources like VPCs, EC2 instances, S3 buckets, etc., you can use outputs to display important properties such as IP addresses, resource IDs, or URLs, making them easy to reference in the future.

Passing Information Between Modules:

Outputs are useful when working with modules. You can define outputs in a child module and reference them in the parent module.

Interacting with Other Automation or Scripts:

Outputs can be captured programmatically using terraform output to pass values to other systems, scripts, or pipelines.

Cloud Provider-specific Information:

When provisioning resources like load balancers, databases, or server instances, you often need to retrieve data such as the DNS name, public IP, or database connection string.

Troubleshooting and Debugging:

Outputs can help you see critical information about your infrastructure to verify configurations or troubleshoot any issues with your deployment.


## 
Attributes of the output Block:
value (Required):

This defines the value that you want to expose as output. It could be a variable, resource attribute, or expression.

Example: value = aws_instance.example.public_ip

description (Optional):

A short description of what the output represents. It is not required but helps to provide clarity on what the output signifies.

Example: description = "The public IP address of the EC2 instance"

sensitive (Optional):

By default, Terraform outputs display values in the terminal. If an output contains sensitive data (like passwords or secrets), you can set sensitive = true to prevent its exposure in logs or the console output.

Example: sensitive = true (often used with sensitive data like API keys or passwords).

depends_on (Optional):

You can use depends_on to ensure that outputs are only computed after certain resources or data sources are created or changed. This is useful when you want to control dependencies manually.

Best Practices for Using output
Use Outputs for Key Information:

Use outputs to return values that are useful for interacting with your resources after applying Terraform, such as public IP addresses, DNS names, or database connection strings.

Use Descriptions for Clarity:

Always add a description to your outputs to explain what the output represents, making it easier for others (or even your future self) to understand the context of the output.

Mark Sensitive Data as Sensitive:

Any output containing sensitive information like credentials, API keys, or passwords should be marked with sensitive = true to avoid exposing them in logs and the terminal.

Limit Outputs to Important Data:

Don't output everything. Outputs should be reserved for important information only. Avoid outputting entire objects or unnecessary details as it can clutter your Terraform state and outputs.

Be Mindful of State File Size:

Large outputs can bloat your Terraform state file. Avoid outputting large arrays or entire resource configurations unless absolutely necessary.

Use Outputs for Modular Workflows:

If you are working with Terraform modules, use outputs to expose values from child modules to parent modules. This allows for better modularity and reusability of your Terraform code.

Access Outputs Programmatically:

After running terraform apply, you can use terraform output to retrieve the values of outputs. This is useful for automation scripts or CI/CD pipelines.