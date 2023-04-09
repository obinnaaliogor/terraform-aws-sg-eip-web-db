terraform {
required_version = "~> 1.4"       #1.4.4/5/6/7 1.4/5/6/7 Terraform version for running the code
required_providers {
aws = {
source  = "hashicorp/aws" #aws plugin version 3.0 
version = "~> 3.0" #constrained the aws version to the right most value, any version from 3.0 above will be supported
}
}
backend "s3" {
    bucket = "obinnatfstate-bucket"
    key = "prod/tfstate.tfstate"
    region = "us-east-2"
  }
}
provider "aws" {
  region = "us-east-2"
}

module "web-module" {
  source = "./terraform-aws-web"
/*Error: Reference to undeclared resource
│ 
│   on web/web.tf line 3, in resource "aws_instance" "web":
│    3:   ami = data.aws_ami.ubuntu_user.id
│ 
│ A data resource "aws_ami" "ubuntu_user" has not been declared in module.web-module.*/
  #referencing the right directory ./terraform-aws-web solved the error, it was ./web b4
}

output "webserverpub_ip" {
  value = module.web-module.webserverpub_ip
}

module "dbmodule" {
  source = "./terraform-aws-db"
}
output "PrivateIP" {
value = module.dbmodule.PrivateIP
}