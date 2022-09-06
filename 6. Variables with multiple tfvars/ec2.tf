# Below is the resource block which creates EC2 Instance
# Ways to Pass Values to Variables
# --1) Manually Enter The Values During Deployment of Terraform Commands


#variable "ami_id" {
  #  type = string
#}
#variable "instance_type" {}

#variable "ec2_tag_name" {}


# --variable "ami_id" {
  #  type = string
  # ---[NOTE] --Writing the variable this way without adding the value here means that you have to enter the value at runtime
  # --[ami-0cff7528ff583bf9a]
#}

# --variable "instance_type" {}
# ---[NOTE] --Writing the variable this way without adding the value here means that you have to enter the value at runtime
# --[t2.micro]

# --variable "ec2_tag_name" {}
# ---[NOTE] --Writing the variable this way without adding the value here means that you have to enter the value at runtime
# --[ec2variables]


# Ways to Pass Values to Variables
# --2) hardcode the values into the variable itself using a default argument.


#variable "ami_id" {
  #  type = string
  #  default="s"
#}
#variable "instance_type" {
  #  default = "t2.micro"
#}

#variable "ec2_tag_name" {
  #  default = "ec2variables"
#}

# Ways to Pass Values to Variables
# --3) Pass Values in the Command using var flag.

# --During runtime, you can run the variables in the command promt when running your code
# --terraform plan -var "ami_id=ami-0cff7528ff583bf9a" -var "instance_type=t2.micro" -var "ec2_tag_name=ec2variable"
# --terraform apply -var "ami_id=ami-0cff7528ff583bf9a" -var "instance_type=t2.micro" -var "ec2_tag_name=ec2variable"


# Ways to Pass Values to Variables
# --4) .tfvars file   [NOTE] --Using .tfvars to pass variable allows you to create specific 
# --variables for different department in your organization.
# --dev.tfvars
# --prod.tfvars
# --test.tfvars

# --terraform plan --var-file=variables/dev.tfvars
# --terraform apply --var-file=variables/dev.tfvars


resource "aws_instance" "web" {  
  ami           = var.ami_id    # --[NOTE] -->To use the above variables, you have to write the source code this way
  instance_type = var.instance_type
  # ---# --[NOTE] -->To use the above variables, you have to write the source code this way
  tags = {
    Name = var.ec2_tag_name   # --# --[NOTE] -->To use the above variables, you have to write the source code this way
  }
}

# --To configureed the providers you have to run [terraform init] this is done once 
# --You dont have to configure the provider folder again, only if there is change made to the provider section.
# --After you successfully configure your provider, you can run these next 3 commands
# --When you Run -->[terraform plan], which is a dry run, you have to enter the
# --Run -->[terraform apply] to launch template to create the resource in your account
# --Run -->[terraform destroy] to terminate the resources that was created 