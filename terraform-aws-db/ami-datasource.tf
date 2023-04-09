data "aws_ami" "ubuntu" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"] #for amazon linux 2 AMI
    #values = ["ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"] #gets you ubuntu AMI
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  
}

output "amidata" {
value = data.aws_ami.ubuntu.id
}
#to get the ami it will be data.resourcetype.resourcename.attribute #attribute is id
#This ami id that will be gotten will be passed into the ami fild in the instance