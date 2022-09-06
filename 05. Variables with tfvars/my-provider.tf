# Below is the provider which helps in connecting with AWS Account
provider "aws" {  # --Provider type
  region = "us-east-1"  # --Region where you want resources to be launch at.
  profile = "default"   # --The account the resources are to be deployed in.
}