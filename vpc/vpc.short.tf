resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-terraform"
  }
}
// Public
resource "aws_subnet" "public" {
  count = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.az, count.index)
  tags = {
    Name = "public"
  }
}
  


// Private

resource "aws_subnet" "private" {
    count = 2
    vpc_id     = aws_vpc.main.id
    cidr_block = element(var.private_subnet_cidrs, count.index)
    availability_zone = element(var.az, count.index)   
    
    tags = {
        Name = "private"
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
    #count = 3
  
}
resource "aws_nat_gateway" "ngw" {
    #count = 3
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = aws_subnet.public[0].id      // index number 0 means  1 

  tags = {
    Name = "vpc-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}




resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

   tags = {
    Name = "public-rt"
  }
}
resource "aws_route_table_association" "public_assoication" {
  count = 2  //allows you to create multiple similar resources with a single block of configuration
  subnet_id      = element( aws_subnet.public.*.id, count.index ) 
  // element function to select the subnet IDs from the list of subnet ID
  route_table_id = aws_route_table.public_rt.id
  // This line specifies the ID of the route table to associate with the subnets, references the ID of the route table 
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

   tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private_assoication" {
  count = 2
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id    // This line specifies the ID of the route table to add the route to.
}

resource "aws_route" "igw_route" {       //This line begins the definition of a Terraform resource named
  route_table_id            = aws_route_table.public_rt.id
  destination_cidr_block    = "0.0.0.0/0"    //This line specifies the destination CIDR block for the route
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route" "ngw_route" {      // this is ID of the NAT gateway to use for the route
  route_table_id            = aws_route_table.private_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.ngw.id
}