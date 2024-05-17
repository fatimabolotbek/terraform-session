resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-terraform"
  }
}


 resource "aws_subnet" "Public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public1"
  }
}


 resource "aws_subnet" "Public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Public2"
  }
}

 resource "aws_subnet" "Public3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Public3"
  }
}


 resource "aws_subnet" "Private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.11.0/24"

  tags = {
    Name = "Private1"
  }
}


 resource "aws_subnet" "Private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.12.0/24"

  tags = {
    Name = "Private2"
  }
}


 resource "aws_subnet" "Private3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.13.0/24"

  tags = {
    Name = "Private3"
  }
}


resource "aws_route_table" "private-vpc-route_table" {
  vpc_id = aws_vpc.main.id

    tags = {
    Name = "private-vpc-route-table"
  }
}

resource "aws_route_table" "public-vpc-route_table" {
  vpc_id = aws_vpc.main.id

    tags = {
    Name = "public-vpc-route-table"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "vpc-int-gateway"
  }
}

resource "aws_eip" "lb" {
  
}
resource "aws_nat_gateway" "Public" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.Public3.id

  tags = {
    Name = "vpc-gw-nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table_association" "Public1" {
  subnet_id      = aws_subnet.Public1.id
  route_table_id = aws_route_table.public-vpc-route_table.id
}

resource "aws_route_table_association" "Public2" {
  subnet_id      = aws_subnet.Public2.id
  route_table_id = aws_route_table.public-vpc-route_table.id
}

resource "aws_route_table_association" "Public3" {
  subnet_id      = aws_subnet.Public3.id
  route_table_id = aws_route_table.public-vpc-route_table.id
}

resource "aws_route_table_association" "Private1" {
  subnet_id      = aws_subnet.Private1.id
  route_table_id = aws_route_table.private-vpc-route_table.id
}


resource "aws_route_table_association" "Private2" {
  subnet_id      = aws_subnet.Private2.id
  route_table_id = aws_route_table.private-vpc-route_table.id
}

resource "aws_route_table_association" "Private3" {
  subnet_id      = aws_subnet.Private3.id
  route_table_id = aws_route_table.private-vpc-route_table.id
}


resource "aws_route" "ingv-rtbl" {
  route_table_id            = aws_route_table.public-vpc-route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_route" "nat-gateway" {
  route_table_id            = aws_route_table.private-vpc-route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.Public.id
}
