resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.my-example-vpc.id

  tags = {
    Name = "VPC Gateway"
  }
}

resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.my-example-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "Public Subnet Route"
  }
}

resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.my-example-vpc.id
  tags = {
    Name = "Private"
  }
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public-subnet.id
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"
}
resource "aws_nat_gateway" "public-subnet" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-subnet.id
  depends_on    = [aws_internet_gateway.gateway]
}
