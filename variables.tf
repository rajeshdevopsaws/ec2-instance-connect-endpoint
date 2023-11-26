
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "key_name" {
  default = "my_ec2_instance_connect_endpoint_key"
}

variable "ami_id" {
  default = "ami-03d5c68bab01f3496"
}