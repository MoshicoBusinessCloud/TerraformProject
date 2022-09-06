# Below is the provider which helps in connecting with AWS Account
# Configure the AWS Provider

# --To configureed the providers you have to run [terraform init] this is done once 
# --You dont have to configure the provider folder again, only if there is change made to the provider section.
# --After you successfully configure your provider, you can run these next 3 commands
# --When you Run -->[terraform plan], which is a dry run, you have to enter the
# --Run -->[terraform apply] to launch template to create the resource in your account
# --Run -->[terraform destroy] to terminate the resources that was created

provider "aws" {
  region     = var.region
  access_key = "AKIAZV44T7FUHXUUGEXZ"
  secret_key = "JOhnYjdi3YsGkeGv5lbUPhKrGBQhwRz99L8kRUIt"
}