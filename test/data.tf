resource "aws_default_vpc" "vpc" {
  tags = {
    Name = "default"
  }
}



data "aws_ami" "ami" {
    most_recent = true
    owners      = [ "amazon" ]

  filter {
    name = "name"
    values = [ "*linux*" ]
  }
}
data "aws_key_pair" "key" {
  key_name = "key"  
}