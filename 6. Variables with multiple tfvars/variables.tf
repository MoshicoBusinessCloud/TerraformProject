# Below is the variables blocks
# --https://www.terraform.io/language/values

# --Variables consist of these characters:

# --String:
# Example; "jjtechinc", "jjtechinc12345", "12345"

#--Number:
# Example; 12345

# --List:
# Example; list can be anything, [1,2,3,4,5,] or [1,2,3,4,5,"jjtechinc", "clubmed", "small", "middium", "large"]

# --Map:
# Example; map is a key value pair: 
#  {
   #    linux = "ami-26748764999378fb",
   #    ubuntu = "3564587367498937849pf"
#  }

# --Bool:
# Example; true or false

###############################################################################################
###############################################################################################

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
  #  default="ami-0cff7528ff583bf9a"
#}
#variable "instance_type" {
  #  default = "t2.micro"
#}

#variable "ec2_tag_name" {
  #  default = "ec2variables"
#}



variable "ami_id" {
    type = string
    default = "ami-0cff7528ff583bf9a"
}


variable "instance_type" {
  default = "t2.micro"
}


variable "ec2_tag_name" {
  default = "ec2variable"
}

variable "region" {
  default = "us-east-1"
}



#--Using the variable this way without inputting values on the variable file 
#--means that you have to enter the values at launch or runtime. 
