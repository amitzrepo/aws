# Local file script for direct execution.
resource "local_file" "ssh_connect" {
  filename = "ssh_connect.bat"
  content = "ssh -i ${aws_key_pair.my_key_pair.key_name}.pem ec2-user@${aws_instance.pub_ins.public_ip}"
}


# Local file output display after exectution.
output "ssh_connection" {
  value = local_file.ssh_connect.content
}

# Local copy of key_pair
resource "local_file" "tf_key" {
  content  = tls_private_key.rsa_key.private_key_pem
  filename = "tf_key.pem"
}

resource "null_resource" "copy_execute" {
      
    connection {
    type = "ssh"
    host = aws_instance.pub_ins.public_ip
    user = "ec2-user"
    private_key = file("${aws_key_pair.my_key_pair.key_name}.pem")
    }

 
  provisioner "file" {
    source      = "${aws_key_pair.my_key_pair.key_name}.pem"
    destination = "/home/ec2-user/${aws_key_pair.my_key_pair.key_name}.pem"
  }
  
   provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /home/ec2-user/${aws_key_pair.my_key_pair.key_name}.pem",
    ]
  }
  
  depends_on = [ aws_instance.pub_ins ]
  
  }