# Below is the variables blocks
# --Here you can enter the values required to create the resources that you have in the main. 
# --How to write your variables: Start with -->>[variable] space + ["variable type"] 
# --space + {(press enter to move to next line) write: default = "the value to the variable"} 
# --You have two options here, you either hardcode a default value here or leave it blank and 
# --enter a value at runtime. For this Example, we are going to leave the variable here blank
# --because we are going to use the tfvars variable to store the values.
#=============================================================================================

variable "ami_id" {}   # --We are leaving this blank

variable "instance_type" {}   # --We are leaving this blank

variable "ec2_name_tag" {}  # --We are leaving this blank 
