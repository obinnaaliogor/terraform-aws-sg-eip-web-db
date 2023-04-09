resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami = data.aws_ami.ubuntu_user.id
  user_data = file("./terraform-aws-web/httpd.sh")
security_groups = [module.sgmodule.sg_name] /*output of the SG name, module.sgmodule.sg_name is passed here
b/c we called sg module here, and we cannot just use the output from the SG module(folder) directly, we have to create a new output
for the security group here b/c the SG and web modules are not in the same folder. You can also use security group ids or name.
#values should be referenced as list.*/
  tags = {
    Name = "WebServer"
  }
}
output "webserverpub_ip" { #getting the pub/elastic ip of the webserver
  value = aws_instance.web.public_ip
}

module "sgmodule" { #called the sg module here. 
  source = "../terraform-aws-sg"
}
output "sg_name" {
value = module.sgmodule.sg_name
}


module "eipmodule" {
  source = "../terraform-aws-eip"
  instance_id = aws_instance.web.id #Here i called the eip module
}
output "Public_IP" {
  value = module.eipmodule.Public_IP
}