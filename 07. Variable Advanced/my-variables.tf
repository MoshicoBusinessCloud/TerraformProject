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
  #  default = {
  #  linux  = "ami-XXXXXXXXX",
  #  ubuntu = "ami-XXXXXXXXX"
  #  ----[NOTE] -->This is a Map variable and is being used to list the ami_id value of both instances.
#}
#}
#variable "instance_type" {
                  #   0          1          2   [NOTE] --The number line starts from "0, 1, 2, 3"
  #  default = ["t2.medium", "t2.micro"]
  #  ----[NOTE] -->This is a list(string) variable and is being used to list the "instance_types" value of both instances.
  #  type    = list(string)
#}

#variable "ec2_tag_name" {
  #  default = ["firstinstance", "secondinstance"]
  #  ----[NOTE] -->This is a list variable and is being used to list the "name" value of both instances.
#}



variable "ec2_name_tag" {
  default = ["firstinstance", "secondinstance"]  
}

variable "instance_type" {
              #   0          1          2
  default = ["t2.medium", "t2.micro"]
  type    = list(string)
}
variable "ami_ids" {
  default = {
    linux  = "ami-XXXXXXXXX",
    ubuntu = "ami-XXXXXXXXX"
  }
}


