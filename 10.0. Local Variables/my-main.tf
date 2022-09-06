###########################################################################################
# Example - 1
###########################################################################################
# Local Variables Block
# --Local variables are used mostly used for manditory taggings. There are multiple way to write local variables: 
# locals {  This is the logicalname of the variables.
#   common_tags={   ---This is the logicalname of the environment.
#     Owner = "Devops Team"       <<--- This tag will appear on the instance.  and will be refference at launchtime
#     cs = "avinash@jjtechinc.co"      <<--- This tag will appear on the instance. and will be refference at launchtime
#   }
#   prod_tags={      <<--- This tag will appear on the instance.  and will be refference at launchtime
#     Owner = "Prod Team"   <<--- This tag will appear on the instance.  and will be refference at launchtime
#     cs = "mamidi@jjtechinc.co"     <<--- This tag will appear on the instance.
#     time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())    <<---The  date and time tag will appear on the instance.

#   }
#   dev_tags={     <<--- This tag will appear on the instance and will be refference at launchtime
#     Owner = "dev Team"        <<--- This tag will appear on the instance. and will be refference at launchtime
#     cs = "mamidi@jjtechinc.co"           <<--- This tag will appear on the instance.  and will be refference at launchtime
#     time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp()) <<--- This tag will appear on the instance. and will be refference at launchtime
#   }
# }

# # Below is the resource block which creates EC2 Instance
# resource "aws_instance" "test1" {  ---This part indicatesthe resource type.
#    ami = "ami-052efd3df9dad4825"   --This is an Ubuntu ami_id from us-eats-1
#    instance_type = "t2.large"
#   tags = merge(local.common_tags,{Name = "HelloWorld"})   The function [merge] is used here to combined 
# --the local tags and the instance name tags [tags=local.common_tags] plus [{Name = "common_tags"}]
# }


# resource "aws_instance" "test2" {   ---This part indicatesthe resource type.
#    ami = "ami-0cff7528ff583bf9a"   --This is a Linux ami_id from us-eats-1
#    instance_type = "t2.micro"
#   tags = merge(var.env == "dev" ? local.dev_tags : local.prod_tags,{Name = "dev"}) The function [merge] is used here to combined 
# --the local tags and the instance name tags [tags=local.dev_tags] plus [{Name = "dev_tags"}] 
# --Condition is being used here, if the condition is true, pick the [local.dev_tags] + [{Name = "dev"}]
# --if the condition is false, pick the [local.prod_tags] + [{Name = "dev"}]
# }

# resource "aws_instance" "test3" {  ---This part indicatesthe resource type.
#    ami = "ami-052efd3df9dad4825"   --This is an Ubuntu ami_id from us-eats-1
#    instance_type = "t2.large"
#   tags = merge(local.common_tags,{Name = "common_tags"},{Time = "10M"}) The function [merge] is used here to combined 
# --the local tags and the instance name tags [tags=local.common_tags] plus [{Name = "common_tags"}]
# }


###########################################################################################
# Example - 2
###########################################################################################
locals {   # This is the logicalname of the variables.
 common_tags = {    #---This is the logicalname of the environment.
   Owner = "DevOps Team"  # <<--- This tag will appear on the instance.  and will be refference at launchtime
   service = "backend"   # <<--- This tag will appear on the instance.  and will be refference at launchtime
 }
}


resource "aws_instance" "app-dev" {   #---This part indicatesthe resource type.
  ami = "ami-0cff7528ff583bf9a"     # --This is a Linux ami_id from us-eats-1
  instance_type = "t2.micro"
  tags = local.common_tags    # --The local tags here is being refference from the variable section
}

resource "aws_instance" "db-dev" {    #---This part indicatesthe resource type.
  ami = "ami-052efd3df9dad4825"   #--This is an Ubuntu ami_id from us-eats-1
  instance_type = "t2.small"
  tags = local.common_tags  # --The local tags here is being refference from the variable section
}

resource "aws_ebs_volume" "db_ebs" {    #---This part indicatesthe resource type.
 availability_zone = "us-east-1a"     # --This ebs will be created in us-east-1a
 size              = 8    # --The size of the ebs valume
 tags = local.common_tags  # --The local tags here is being refference from the variable section 
}