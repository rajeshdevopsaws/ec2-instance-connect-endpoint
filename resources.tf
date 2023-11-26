# Define SSH key pair for our instances

resource "random_string" "random_name" {
  length  = 10
  special = false
  upper   = false
}

resource "tls_private_key" "my_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  key_name   = var.key_name
  public_key = tls_private_key.my_ssh_key.public_key_openssh
}

resource "aws_instance" "wb" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ssh.key_name
  subnet_id                   = aws_subnet.private-subnet.id
  vpc_security_group_ids      = [aws_security_group.securtiy_group.id]
  associate_public_ip_address = false
  source_dest_check           = false
  tags = {
    Name = "EC2-instance-connect-endpoint"
  }
}

resource "aws_ec2_instance_connect_endpoint" "ec2_connect_endpoint" {
  subnet_id          = aws_subnet.public-subnet.id
  security_group_ids = [aws_security_group.securtiy_group.id]
  preserve_client_ip = false
}