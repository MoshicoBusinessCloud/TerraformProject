# Below is the resource block which creates EC2 Instance
# --In this tutorial, we are using two types of function variables to deploy our Ec2 instances.
# --The index function variable is use to finds the element index for a given value in a list.
# --The returned index is zero-based. This function produces an error if the given value is not present in the list.
#Here we going to use index to assign name_tag to the instances and the instance_type.   
# --Next, we have the map varainle for our instance ami_id.

# variable "ec2_name_tag" {  #--This is the logical name for the variable.
#   default = ["name1", "name2","name3"] # --This is a list variable
# }

# variable "instance_type" {
#             #   0          1          2
#   default = ["t2.micro", "t2.medium","t2.nano"]  # --This is a list variable
# }
# variable "ami_ids" {  #--This is the logical name for the variable.
#   default = {   # --This is a map variable and a list of default ami_ids. If no ami specify when launching the instance, terraform will use the default ami list.
#     0 = "ami-00f7e5c52c0f43726",
#     1 = "ami-0892d3c7ee96c0bf7",
#     2 = "ami-0892d3c7ee96c0bf7"
#   }
# }
# By default, a resource block configures one real infrastructure object (and similarly, 
# a module block includes a child module's contents into the configuration one time). 
# However, sometimes you want to manage several similar objects (like a fixed pool of compute instances) 
# without writing a separate block for each one. Terraform has two ways to do this: count and for_each.
#--------------------------------------------------------------------------------------------------------
# The for_each meta-argument accepts a map or a set of strings, 
# and creates an instance for each item in that map or set. 
# Each instance has a distinct infrastructure object associated with it,
# and each is separately created, updated, or destroyed when the configuration is applied.
# --Here we are creating three instances based on the set of variables associated withis resources code
#--------------------------------------------------------------------------------------------------------

# --The for_each use a loop function method to loop through the list index function variable
# --and grab the approprate value needed to create the first instance, and then repeat the loop
# --to create the second instance, and in this case, loop through the third time and grab the 
# --property needed to create the last instance.
#---------------------------------------------------------------------------------------------------------------------------------------------------    
# --Instructions when creating the first instance [for_each]--ami = each.value is to loop through the ami_id variable, 
# --and it has been instructed to pick the first ami_id that corespond with the "0" value place on the index count
# --For instance_type = var.instance_type[each.key], pick the first instance_type [t2.mcro] that corespond with the "0" key place on the index count
# --For Name = var.ec2_name_tag[each.key], pick the first name_tag [name1] that corespond with the "0" key place on the index count
#---------------------------------------------------------------------------------------------------------------------------------------------------
# --Instructions when creating the second instance [for_each]--ami = each.value is to loop through the ami_id variable, 
# --and it has been instructed to pick the first ami_id that corespond with the "1" value place on the index count
# --For instance_type = var.instance_type[each.key], pick the second instance_type [t2.midium] that corespond with the "1" key place on the index count
# --For Name = var.ec2_name_tag[each.key], pick the second name_tag [name2] that corespond with the "1" key place on the index count
#-----------------------------------------------------------------------------------------------------------------------------------------------------
# --Instructions when creating the third instance [for_each]--ami = each.value is to loop through the ami_id variable, 
# --and it has been instructed to pick the first ami_id that corespond with the "2" value place on the index count
# --For instance_type = var.instance_type[each.key], pick the third instance_type [t2.nano] that corespond with the "2" key place on the index count
# --For Name = var.ec2_name_tag[each.key], pick the third name_tag [name3] that corespond with the "2" key place on the index count
#----------------------------------------------------------------------------------------------------------------------------------------------------
resource "aws_instance" "test" { #--This line indicate the type resource and the logical name of the resource.
  for_each = var.ami_ids #[NOTE] This is use to refference the variable section and the instruction for assigning the right ami_id
  ami           = each.value
  instance_type = var.instance_type[each.key] #[NOTE] This is use to refference the variable section and the instruction for assigning the instance_type
  tags = {
    Name = var.ec2_name_tag[each.key]   #[NOTE] This is use to refference the variable section and the instruction for assigning the instance_type
  }
}

#1. Loop
# --[0 = ami-00f7e5c52c0f43726}
# --[t2.micro]
# --[name1]

#2. Loop
# --[1 = ami-0892d3c7ee96c0bf7]
# --[t2.medium]