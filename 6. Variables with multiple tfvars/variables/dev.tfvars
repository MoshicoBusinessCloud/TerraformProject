# --terraform plan --var-file=variables/dev.tfvars
# --terraform apply --var-file=variables/dev.tfvars
# --terraform destroy --var-file=variables/dev.tfvars


# --The variables from here will be pass when you want to create an ec2 instance on the dev environment
# --Meaning that, during runtime the resource code will come here to grab these values to create the instane.

region="us-east-1"   # [NOTE] This value will be call from the provider section
ami_id="ami-0cff7528ff583bf9a"  # [NOTE] This value will be call from the resource section
instance_type="t2.micro"        # [NOTE] This value will be call from the resource section
ec2_tag_name="devinstance"      # [NOTE] This value will be call from the resource section


# --One of the problem with passing values using .tfvars is that after creating a resource in one environment --[dev.tfvars]..
# --When you want to create the same resource in another environment, let say --[prod.tfvars] with different details,
# --terraform will think that you are trying to make modifications to the first resource that you created in --[dev.tfvars]
# --as a result of that terraform will try to destroy that resource in --[de.tfvars] before creating the the one in --[prod]. 

# --This is the flow of the values moves during runtime: --[variables(dev.tfvars)] ---->> to [variables.tf] ----->>[ec2.tf].
