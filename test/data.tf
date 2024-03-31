data "aws_vpc" "default" {
    
}

data "aws_subnet" "default" {
    filter {
      name = "availability-zone"
      values = [ "ap-south-1a" ]
    }
}

data "aws_ami" "linux" {
    most_recent = true
    owners      = [ "amazon" ]

  filter {
    name = "name"
    values = [ "*linux*" ]
  }
}