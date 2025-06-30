### NULL RESOURCE
🧱 What is null_resource in Terraform?
Imagine you're building a house (your infrastructure), and after it's built, you want to:

Paint the walls 🖌️

Send a message to your friend that the house is ready 📩

Write a label on the front door 🏷️

Now — these extra actions aren’t physical parts of the house. But they are important tasks that should happen after the house is ready.

In Terraform, null_resource is like a to-do list that:

Doesn't create a real thing (like EC2 or S3),

But lets you run scripts or commands (your tasks) at the right time.

## 
🔧 In simple terms:
You want to...	Use null_resource to...
Run a shell command	Use it like a script runner
Copy files to a server	Use provisioner inside it
Say “hey Terraform is done!” in terminal	Use echo in local-exec
Trigger something when a file changes	Use triggers block (like "when file changes, do this")

## 
 So in simple words:
null_resource is the shell. provisioner is the engine that does the actual job.

Without provisioner, a null_resource is like a post-it note with no writing on it — it's there, but it doesn't do anything.