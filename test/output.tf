output "vpc" {
    //value = data.aws_default_vpc.id
    value = aws_default_vpc.vpc.id
}

output "subnet" {
    value = data.aws_default_subnet.subnet.id
}

output "ami" {
  value = data.aws_ami.ami.id
}

output "key" {
  value = data.aws_key_pair.key.id
}