# Below is the resource block which creates EC2 Instance

# --There are multiple way to write count variable:
# --1) You can duplicate and paste multiple ec2 resources on one code and run it to create the amount of duplicate you paste on the code.


# --Count is used to create multiple ec2 instance at the same time. writing the code this way make the block of code dynamic.

# --[NOTE] --Using [count.index] allow you to increase or decrase the number of instance in the variable section.
# --[NOTE] --Using count = length(var.ec2_name_tag) instead of count = the number of instance allow
# --you to increase or decrase the number of instance in the variable section

# resource "aws_instance" "test" {
#   count = length(var.ec2_name_tag)  

#   ami           = var.ami_ids[count.index] 
#   instance_type = var.instance_type[count.index]
#   tags = {
#   Name = var.ec2_name_tag[count.index]
#   }
# }


resource "aws_instance" "test" {
  count = length(var.ec2_name_tag)  

  ami           = var.ami_ids[count.index]
  instance_type = var.instance_type[count.index]
  tags = {
    Name = var.ec2_name_tag[count.index]
  }
}

