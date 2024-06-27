output "vpc_id" {
    value = aws_vpc.pointhub_vpc.id
}

output "pointhub_public_subnet_id" {
    value = aws_subnet.pointhub_public_subnet.id
}

output "pointhub_private_subnet_id" {
    value = aws_subnet.pointhub_private_subnet.id
}


// Create a VPC
resource "aws_vpc" "pointhub_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "pointhub_vpc"
    }
}

#  Create public subnet
resource "aws_subnet" "pointhub_public_subnet" {
    vpc_id = aws_vpc.pointhub_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-southeast-1a"

    tags = {
        Name = "pointhub_public_subnet"
    }
}

# Create private subnet
resource "aws_subnet" "pointhub_private_subnet" {
    vpc_id = aws_vpc.pointhub_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-southeast-1a"

    tags = {
        Name = "pointhub_private_subnet"
    }
}

# Create an Public Internet Gateway
resource "aws_internet_gateway" "pointhub_public_internet_gateway" {
  vpc_id = aws_vpc.pointhub_vpc.id
  tags = {
    Name = "pointhub-public-igw"
  }
}

# Create a Public Route Table
resource "aws_route_table" "pointhub_public_route_table" {
  vpc_id = aws_vpc.pointhub_vpc.id
  route {
    cidr_block = "0.0.0.0/0" # internet
    gateway_id = aws_internet_gateway.pointhub_public_internet_gateway.id
  }
  tags = {
    Name = "pointhub-public-rt"
  }
}

# Public Route Table and Public Subnet Association
resource "aws_route_table_association" "pointhub_public_rt_subnet_association" {
  subnet_id      = aws_subnet.pointhub_public_subnet.id
  route_table_id = aws_route_table.pointhub_public_route_table.id
}

# Create a Private Route Table
resource "aws_route_table" "pointhub_private_route_table" {
  vpc_id = aws_vpc.pointhub_vpc.id
  #depends_on = [aws_nat_gateway.nat_gateway]
  tags = {
    Name = "pointhub_private-rt"
  }
}

# Private Route Table and private Subnet Association
resource "aws_route_table_association" "pointhub_private_rt_subnet_association" {
  subnet_id      = aws_subnet.pointhub_private_subnet.id
  route_table_id = aws_route_table.pointhub_private_route_table.id
}