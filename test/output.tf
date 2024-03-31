output "vpc" {
    value = data.aws_vpc.default.id  
}

output "subnet" {
    value = data.aws_subnet.default.id  
}

output "ami" {
  value = data.aws_ami.linux.id
}