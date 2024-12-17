resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
      Name = "MyVPC"
    }
  
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
      Name = "MyInternetGateway"
    }
}

# Create a Public Subnet
resource "aws_subnet" "public_subnetA" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1a"

    tags = {
        Name = "PublicSubnet-A"
    }
}
resource "aws_subnet" "public_subnetB" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1b"

    tags = {
        Name = "PublicSubnet-B"
    }
}

# Create a Private Subnet
resource "aws_subnet" "private_subnetC" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.3.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1a"

    tags = {
        Name = "PrivateSubnet-C"
    }
}

resource "aws_subnet" "private_subnetD" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.4.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1a"

    tags = {
        Name = "PrivateSubnet-D"
    }
}

resource "aws_subnet" "private_subnetE" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.5.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1b"

    tags = {
        Name = "PrivateSubnet-E"
    }
}

resource "aws_subnet" "private_subnetF" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.6.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1b"

    tags = {
        Name = "PrivateSubnet-F"
    }
}

# Create a DB subnet group that includes Subnet-B
resource "aws_db_subnet_group" "mydb_subnet_group" {
  name       = "mydb-subnet-group"
  subnet_ids = [aws_subnet.public_subnetD.id]

  tags = {
    Name = "MyDBSubnetGroup"
  }
}

# Create a Route Table for the Public Subnet
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }

    tags = {
        Name = "MyPublicRouteTable"
    }
}

# Associate the Public Subnet with the Route Table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
