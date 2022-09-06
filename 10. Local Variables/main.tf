###########################################################################################
# Example - 1
###########################################################################################
# Local Variables Block
# locals {
#   common_tags={
#     Owner = "Devops Team"
#     cs = "avinash@jjtechinc.co"
#     time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
#   }
#   prod_tags={
#     Owner = "Prod Team"
#     cs = "mamidi@jjtechinc.co"
#     time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())

#   }
#   dev_tags={
#     Owner = "dev Team"
#     cs = "mamidi@jjtechinc.co"
#     time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
#   }
# }

# # Below is the resource block which creates EC2 Instance
# resource "aws_instance" "test1" {
#    ami = "ami-052efd3df9dad4825"
#    instance_type = "t2.large"
#   tags = merge(local.common_tags,{Name = "HelloWorld"})
# }


# resource "aws_instance" "test2" {
#    ami = "ami-0cff7528ff583bf9a"
#    instance_type = "t2.micro"
#   tags = merge(var.env == "dev" ? local.dev_tags : local.prod_tags,{Name = "dev"})
# }

# resource "aws_instance" "test3" {
#    ami = "ami-052efd3df9dad4825"
#    instance_type = "t2.large"
#   tags = merge(local.common_tags,{Name = "common_tags"})
# }


###########################################################################################
# Example - 2
###########################################################################################
locals {
  test_tags={
    Owner = "testing Team"
    cs = "mosesboyh@jjtechinc.co"
   
  }
  prod_tags={
    Owner = "Prod Team"
    cs = "mamidi@jjtechinc.co"
    

  }
  dev_tags={
    Owner = "dev Team"
    cs = "soundboy@jjtechinc.co"
  }
}

# Below is the resource block which creates EC2 Instance
resource "aws_instance" "test1" {
   ami = "ami-052efd3df9dad4825"
   instance_type = "t2.large"
  tags = local.test_tags
}


resource "aws_instance" "test2" {
   ami = "ami-0cff7528ff583bf9a"
   instance_type = "t2.micro"
  tags = local.dev_tags
}

resource "aws_instance" "test3" {
   ami = "ami-052efd3df9dad4825"
   instance_type = "t2.large"
  tags = local.prod_tags
}