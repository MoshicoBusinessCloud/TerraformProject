# Below is the provider which helps in connecting with AWS Account
provider "aws" {
  region     = "us-east-2"
}

# # Below is the variables blocks
# variable "tags" {
#   type = list
#   default = ["firstec2","secondec2"]
# }

# variable "ami" {
#   type = map
#   default = {
#     "us-east-1" = "ami-XXXXXXXXXXXX"
#     "us-west-2" = "ami-XXXXXXXXXXXX"
#     "ap-south-1" = "ami-XXXXXXXXXXXX"
#   }
# }


# Local Variables Block
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  # --This block of code is using two functions, --[formatdate] and --[timestamp(]. 
  # --Whe you run this code, it will display the actual date and time in this form.. 
  #--[DD=01-, MMM=Aug-, YYYY=2022-, hh:mm=11:21-, ZZZ=UTC] 
}

# Below is teh Output blocks
output "timestamp" {
  value = timestamp()
# --This block of code is using one functions, --[timestamp(]. [hh:mm=11:21-, ZZZ=UTC]
}

output "formattedtimestamp" {
  value = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  # --This block of code is using two functions, --[formatdate] and --[timestamp(]. 
  # --Whe you run this code, it will display the actual date and time in this form.. 
  #--[DD=01-, MMM=Aug-, YYYY=2022-, hh:mm=11:21-, ZZZ=UTC]
}

output "publicip" { # --This is the logical name of the Output
  value = aws_instance.myec2.public_ip # --This line is get and displayed the public IP of the instance once it is created.
}
output "private" {
  value = aws_instance.myec2.private_ip  # --This line is get and displayed the private IP of the instance once it is created.
}

# Below is the resource block which creates EC2 Instance
resource "aws_instance" "myec2" {
  ami = "ami-051dfed8f67f095f5"
  instance_type = "t2.micro"
  tags = {
    Name = "test" # --This is the name of the instance
  }
}

# --When you run the above block of codes you should see the value bellow and one resource will be created on your account in us-east-2
# [formattedtimestamp = "02 Aug 2022 19:40 UTC"]
# [private = "172.31.47.117"]
# [publicip = "3.17.24.128"]
# [timestamp = "2022-08-02T19:40:13Z"]
# PS C:\Users\brown\OneDrive\Desktop\Terraform-main\Terraform-main\11.0. Terraform Functions & Outputs> 
