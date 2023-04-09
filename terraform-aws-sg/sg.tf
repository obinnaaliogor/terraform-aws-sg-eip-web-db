#SECURITY GROUP WITHOUT DYNAMIC BLOCKS
resource "aws_security_group" "Webtraffic" {
  name        = "Webtraffic"
  description = "Allow http and https inbound traffic"

  ingress {
    description      = "allow http and https"
    from_port        = 80
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Webtraffic"
  }
}
output "sg_name" {
  value = aws_security_group.Webtraffic.name
}


