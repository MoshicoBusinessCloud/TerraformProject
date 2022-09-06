# Below is the variables blocks
# --Here you can enter the values required to create the resources that you have in the main. 
# --How to write your variables: Start with -->>[variable] space + ["variable type"] 
# --space + {(press enter to move to next line) write: default = "the value to the variable"} 
# --You have two options here, you either hardcode a default value here or leave it blank and 
# --enter a value at runtime. In this case we are hardcoding default values here.
#=============================================================================================

variable "ami_id" {  # --Variable type
  default = "ami-090fa75af13c156b4"  # --Enter a default value 
}
variable "instance_type" {  # --Variable type
  default = "t2.micro"      # --Enter a default value
}
variable "ec2_name_tag" {   # --Variable type
  default = "DevInstance"   # --Enter a default value
}
