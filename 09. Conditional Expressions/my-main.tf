istest = true  -->   test environment

istest = false -->   prod environment

##########################################################################################
Example - 1
##########################################################################################

# Below is the variables blocks

--This is a Conditional Expressions that is used to determine whether a resource can be created in an environment or not.


variable "istest" { # <<---[NOTE]The variable here is asking if this [istest] environment?
 default = false   # <<---[NOTE] --If the answer "yes", NO resources should be created. [test environment] == [NO/False].
}

# Below is the resource block which creates EC2 Instance
resource "aws_instance" "test" { #[NOTE] --This is a "test" environment, if the condition here is true, 3 instances will be created.
 count  = var.istest == true ? 3 : 0 # [NOTE]--The condition is false because you are not allowed to create instances in the test env.  
 ami    = "ami-098e42ae54c764c35"
 instance_type = "t2.micro"
}

resource "aws_instance" "prod" { # [NOTE] --This is a "prod" environment, if the condition here is true, 1 instance will be created.
 count  = var.istest == false ? 1 : 0 # [NOTE]--The condition is true because you are allowed to create instances in the test env.
 ami    = "ami-098e42ae54c764c35"
 instance_type = "t2.large"
}

##########################################################################################
Example - 2
##########################################################################################

## Below is the variables blocks

variable "istest" { # <<---[NOTE]The variable here is asking if this [istest] environment?
 default = false   # <<---[NOTE] --If the answer "yes", this ubuntu-[ami-052efd3df9dad4825] should not be used to
 # --create the instance in the test environment. [test environment] == [NO/False].
}

# Below is the resource block which creates EC2 Instance
resource "aws_instance" "prod" {                #ubuntu                    #Linux
 ami           = var.istest == "true" ? "ami-052efd3df9dad4825" : "ami-0cff7528ff583bf9a"
 # [NOTE]--The condition above is false, therefore, the instance will be created using the Linux ami.
 instance_type = var.istest == false ? "t2.micro" : "t2.large"
 # [NOTE]--This condition is true so you can use the [t2.micro] to create instances in the test env.
}