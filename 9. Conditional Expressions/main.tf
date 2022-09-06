# istest = true  -->   test environment

# istest = false -->   prod environment

###########################################################################################
# Example - 1
###########################################################################################

# ## Below is the variables blocks
# variable "istest" {
#   default = false
# }

# # Below is the resource block which creates EC2 Instance
# resource "aws_instance" "test" {
#   count         = var.istest == true ? 3 : 0
#   ami           = "ami-0cff7528ff583bf9a"
#   instance_type = "t2.micro"
# }

# resource "aws_instance" "prod" {
#   count         = var.istest == false ? 1 : 0
#  ami           = "ami-0cff7528ff583bf9a"
#   instance_type = "t2.large"
# }

###########################################################################################
# Example - 2
###########################################################################################

## Below is the variables blocks

variable "istest" {
  default = false
}

# Below is the resource block which creates EC2 Instance
resource "aws_instance" "second_example" {
 ami           = var.istest == "true" ? "ami-052efd3df9dad4825" : "ami-0cff7528ff583bf9a"
 
 instance_type = var.istest == false ? "t2.micro" : "t2.large"
}