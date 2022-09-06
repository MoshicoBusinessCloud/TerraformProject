# Below is the resource block which creates EC2 Instance
# Below is the resource block which creates EC2 Instance

# --Writing your code this way make your code dynamic instead of hardcoding 
# --the rources values here. once you variablized your resouce code blocks, 
# --you have to create a variable section that contain the values to the resources.
#=======================================================================================

provider "aws" {   # --this line is for Provider type
  region = var.region   # --Writing the code with[var.] change it from hard coded to dynamic
  profile = var.default  # --Writing the code with[var.] change it from hard coded to dynamic 
}

resource "aws_instance" "test" { # --this line is for resource type and the name of the resource 
  ami           = var.ami_id  # --Writing the code with[var.] change it from hard coded to dynamic
  instance_type = var.instance_type  # --Writing the code with[var.] change it from hard coded to dynamic
  tags = {
    Name = var.ec2_name_tag  # --Writing the code with[var.] change it from hard coded to dynamic
  }
}

