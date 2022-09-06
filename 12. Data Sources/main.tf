# Below is the provider which helps in connecting with AWS Account

# --The block of code bellow is ctreating one resource and the configuration..
# --of the code detailed what terraform need to do when creating the instance.
# --There are two main task terraform need to under-take to get the job done:
# --1) Terraform need to go to the account and look for the [Amazon Resource Name [ARN]]
# --of the S3 bucket that is refferenced in the data section of the code and use it as name of the instance. 

# --2) Terraform need to go to us-east-1 and look for a specific type of AMI --[amzn2-ami-hvm*] 
# --and pick the most recent one of that ami to create the instance.

# --For this example, the provider, the s3 bucket, and the ami all have to be from us-eaat-1 
provider "aws" {
  region     = "us-east-1"
}

data "aws_s3_bucket" "selected" {  # --The is the syntex of data source
  bucket = "example-demo-bucket-360" # --Copy any bucket name from your account and paste it here.
}

# # Below is the Data Sources Block
data "aws_ami" "app_ami" {  # --The is the syntex of data source
  most_recent = true  # --This function is used to get the most recent ami
  owners = ["amazon"]  # --The owner of the ami is Amazon

  filter {  # --The is the syntex of the filter 
    name   = "name"     # --The is the syntex function: KEY/Name = Name(name of the ami) 
    values = ["amzn2-ami-hvm*"]   # --The is the syntex of function: value = (the name of the ami) ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {  # --The is the syntex and the type of resource that is being created.
  ami = data.aws_ami.app_ami.id  # --The resource is refferencing the ami_id from the data section and that is how to write the syntex.
  instance_type = "t2.micro"
  tags = {
    Name = data.aws_s3_bucket.selected.arn # --The tag will get the bucket ARN from the data section during creation of the resource.
  }
}

# --You should see this as the name of the Instance one apply is complete --[arn:aws:s3:::example-demo-bucket-360]


#below is just an example which doesn't work
#data "aws_ami" "app_ami" {
#  most_recent = true
#  owners = ["464599248654"]
#
#  filter {
#    name   = "name"
#    values = ["golden*"]
#  }
#}

#data "aws_ami" "app_ami" {
#    most_recent = true
#
#    filter {
#        name   = "name"
#        values = ["*ubuntu*"]
#    }
#
#    filter {
#        name   = "virtualization-type"
#        values = ["hvm"]
#    }
#
#    owners = ["amazon"] # Canonical
#}
#
# resource "aws_instance" "instance-1" {
#     ami = data.aws_ami.app_ami.id
#    instance_type = "t2.micro"
# }

#output "test" {
#  value = data.aws_ami.app_ami
#}


#variable "bucketname" {
#  default = "avinash-del-test-1"
#}
#
#data "aws_s3_bucket" "mys3buck" {
#  bucket = var.bucketname
#}
#
#output "s3detailsid" {
#  value = data.aws_s3_bucket.mys3buck
#}
#output "s3detailsarn" {
#  value = data.aws_s3_bucket.mys3buck.arn
#}


#data --> borowing --> destroy (no)
#
#import --> owning --> update/destroy

# data "aws_s3_bucket" "selected" {
#   bucket = "example-demo-bucket-360"
# }

# resource "aws_instance" "myec2" {
#   ami = 
#   instance_type = "t2.micro"
#   tags = {
#     Name = data.aws_s3_bucket.selected.arn
#   }
# }
