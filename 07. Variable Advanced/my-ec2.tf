# Below is the resource block which creates EC2 Instance

# --This block of code will create two ec2 instances with different details
# --8and it is refferencing the values needed to create the instances from the variable section.
# --There are 6 variables needed to craete the instances, 3 for each one. this is because the 2 instances have different details. 

resource "aws_instance" "test" {
  ami           = var.ami_ids["linux"]  # --This line is refferencing the ami_id from the variable section
  instance_type = var.instance_type[0] # --The instance_type that is "0" position will be call when creating this instance
  tags = {
    Name = var.ec2_name_tag[0]  # --The tag name that is "0" position will be call when creating this instance
  }
}
resource "aws_instance" "test2" {
  ami           = var.ami_ids["ubuntu"]   # --This line is refferencing the ami_id from the variable section
  instance_type = var.instance_type[1]    # --The instance_type that is "1" position will be call when creating this instance
  tags = {
    Name = var.ec2_name_tag[1]            # --The tag name that is "1" position will be call when creating this instance 
  }
}


