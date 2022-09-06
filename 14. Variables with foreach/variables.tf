# Below is the variables blocks
variable "ec2_name_tag" {
  default = ["name1", "name2","name3"]
}

variable "instance_type" {
            #   0          1          2
  default = ["t2.micro", "t2.medium","t2.nano"]
}

variable "ami_ids" {
  default = {
    0 = "ami-090fa75af13c156b4",
    1 = "ami-090fa75af13c156b4",
    2 = "ami-090fa75af13c156b4"
  }
}