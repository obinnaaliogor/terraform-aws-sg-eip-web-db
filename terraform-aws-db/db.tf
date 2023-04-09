
resource "aws_instance" "db" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "DbServer"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}