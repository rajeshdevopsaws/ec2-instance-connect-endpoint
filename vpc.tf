resource "aws_vpc" "my-example-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-ec2-instance-connect-endpoint-vpc"
  }
}
