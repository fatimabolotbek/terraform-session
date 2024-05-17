resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-terraform"
  }
}


 resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-1"
  }
}


 resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public-2"
  }
}

 resource "aws_subnet" "public_3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "public-3"
  }
}


 resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.11.0/24"

  tags = {
    Name = "private-1"
  }
}


 resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.12.0/24"

  tags = {
    Name = "private-2"
  }
}


 resource "aws_subnet" "private_3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.13.0/24"

  tags = {
    Name = "private-3"
  }
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

    tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

    tags = {
    Name = "public-route-table"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "vpc-igw"
  }
}

resource "aws_eip" "ngw_eip" {
  
}
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "vpc-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_3" {
  subnet_id      = aws_subnet.public_3.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_route_table.id
}


resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_3" {
  subnet_id      = aws_subnet.private_3.id
  route_table_id = aws_route_table.private_route_table.id
}


resource "aws_route" "igw_route" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route" "ngw_route" {
  route_table_id            = aws_route_table.private_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.ngw.id
}
