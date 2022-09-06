provider "aws" {
  region = "us-east-1"
}
# --Dynamic block or dynamic ingress is used to reduce the line of code to write

# Key benefits of Terraform dynamic blocks
# The key benefits of Terraform dynamic blocks are: 

# Speed – simplifying the code makes it much quicker to write and also for it to be processed and thus for the infrastructure to be deployed.
# Clarity – in contrast to multiple blocks of repetitive code, it’s much easier to read and understand code written using dynamic blocks.
# Re-use – copying, pasting, and amending large blocks of code is difficult and tedious. Combine dynamic blocks and variables/parameters to streamline this process.
# Reliability – linked to clarity and re-use, errors are less likely to be made in simple, easy-to-read code.


resource "aws_security_group" "dynamicsg" {  # --Type of resource that is being ctreated 
  name        = "dynamic-sg" # --Logical nane of the resource
  description = "Ingress for Vault" # --Destription of the resource 
  dynamic "ingress" {  # --You use [Dynamic] as the keyword and [ingress] is what that is being difined
    for_each = [8200, 8201, 8300, 9200, 9500] # --fer-each is use here to loop and create the ports
    iterator = port # --The iterator is use to loop through the ports starting with least until all ports are open.
    content {
      from_port   = port.value # --The loop value from the iterator is place here and   
      to_port     = port.value
      protocol    = "tcp" 
      cidr_blocks = ["0.0.0.0/0"] # --IPv 4 route to the internet
    }
  }
}
# --when you run the above block of code, you should see this:

# sgr-039eacd30b1cc9a0e	IPv4	Custom TCP	TCP	9200	0.0.0.0/0	–

# –
# sgr-0dbbaa806e936c690	IPv4	Custom TCP	TCP	8201	0.0.0.0/0	–

# –
# sgr-03ae9946a120cfce0	IPv4	Custom TCP	TCP	8300	0.0.0.0/0	–

# –
# sgr-0dff9f6f422afc284	IPv4	Custom TCP	TCP	8200	0.0.0.0/0	–

# –
# sgr-08cccd2da6e71ca5d	IPv4	Custom TCP	TCP	9500	0.0.0.0/0	–



# resource "aws_security_group" "dynamicsg" {
#   name        = "dynamic-sg"
#   description = "Ingress for Vault"
#   dynamic "ingress" {
#     for_each = ["0.0.0.0/0", "0.0.0.0/0","0.0.0.0/0"]
#     iterator = cidr
#     content {
#       from_port   = "8080"
#       to_port     = "8080"
#       protocol    = "tcp"
#       cidr_blocks = [cidr.value]
#     }
#   }
# }


#variable "sg_ports" {
#  type        = list(number)
#  description = "list of ingress ports"
#  default     = [8200, 8201,8300, 9200, 9500]
#}
#
#resource "aws_security_group" "dynamicsg" {
#  name        = "dynamic-sg"
#  description = "Ingress for Vault"
#  dynamic "ingress" {
#    for_each = var.sg_ports
#    iterator = port
#    content {
#      from_port   = port.value
#      to_port     = port.value
#      protocol    = "tcp"
#      cidr_blocks = ["0.0.0.0/0"]
#    }
#  }
#
#  dynamic "egress" {
#    for_each = var.sg_ports
#    iterator = port
#    content {
#      from_port   = port.value
#      to_port     = port.value
#      protocol    = "tcp"
#      cidr_blocks = ["0.0.0.0/0"]
#    }
#  }
#}
