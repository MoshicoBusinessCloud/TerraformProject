# Below is the variables blocks


#variable "ami_id" {
  #  default = {
  #  0 = "ami-00f7e5c52c0f43726",
  #  1 = "ami-0892d3c7ee96c0bf7",
  #  2 = "ami-0892d3c7ee96c0bf7"
  #  ----[NOTE] -->This is a Map variable and is being used to list the ami_id value of three instances.
#}
#}
#variable "instance_type" {
                  #   0          1          2   [NOTE] --The number line starts from "0, 1, 2, 3"
  #  default = ["t2.micro", "t2.medium","t2.nano"]
  #  ----[NOTE] -->This is a list(string) variable and is being used to list the "instance_types" value of three instances.
  #  type    = list(string)
#}

#variable "ec2_tag_name" {
  #  default = ["name1", "name2","name3"]
  #  ----[NOTE] -->This is a list variable and is being used to list the "name" value of three instances.
#}


variable "ec2_name_tag" {
  default = ["name1", "name2","name3"]
}

variable "rigion" {
              #  0            1           2
  default = ["us-east-1","us-east-2","us-west-1"]
}

variable "instance_type" {
            #   0          1          2
  default = ["t2.micro", "t2.medium","t2.nano"]
}

variable "ami_ids" {
  default = {
    0 = "ami-0cff7528ff583bf9a",
    1 = "ami-02d1e544b84bf7502",
    2 = "ami-0d9858aa3c6322f73"
  }
}

