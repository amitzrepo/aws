# resource "null_resource" "copy_execute" {
      
#     connection {
#     type = "ssh"
#     host = aws_instance.foo[0].public_ip
#     user = "ubuntu"
#     private_key = file("${aws_key_pair.my_key_pair.key_name}.pem")
#     }

 
#   provisioner "file" {
#     source      = "${aws_key_pair.my_key_pair.key_name}.pem"
#     destination = "/home/ubuntu/${aws_key_pair.my_key_pair.key_name}.pem"
#   }
  
#   depends_on = [ aws_instance.foo[0] ]
  
#   }