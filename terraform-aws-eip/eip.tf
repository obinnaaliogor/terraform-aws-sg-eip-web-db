resource "aws_eip" "eip" {
  instance = var.instance_id #Required that you attach an eip to an instance. Read the note below
}

output "Public_IP" {
  value = aws_eip.eip.public_ip
}

variable "instance_id" {
  type = string
  #default = "aws_instance.web.id" 
  #This eip i have to attach it to my webServer but since theyre different modules, 
  #I cant just pass the id of the webserver in the eip b/c theyre not in the same directory.
  # I have to call the webserver module here to do that, but i dont want to do that
  #Alternatively, i will only convert the webserver id "aws_instance.web.id" to variable and make it a required variable #default = "aws_instance.web.id"
  #when calling the eip module in the webserver module, i will give the value of the variable.
}