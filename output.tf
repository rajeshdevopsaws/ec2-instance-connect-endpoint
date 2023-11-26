resource "local_file" "aws_key" {
  content  = tls_private_key.my_ssh_key.private_key_pem
  filename = "my_ec2_key.pem"
}

output "instance_id" {
  value = aws_instance.wb.id

}