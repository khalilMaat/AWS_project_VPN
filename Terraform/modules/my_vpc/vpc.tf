# Create a VPC
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
resource "aws_route_table_association" "public_subnetA_association" {
  subnet_id      = aws_subnet.public_subnetA.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnetB_association" {
  subnet_id      = aws_subnet.public_subnetB.id
  route_table_id = aws_route_table.public_route_table.id
}

# NETWORK ACL
resource "aws_network_acl" "mainACL" {
  vpc_id = aws_vpc.my_vpc.id

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "mainACL"
  }
}

# Associate the NACL with Subnets
resource "aws_network_acl_association" "public_subnetA_nacl_assoc" {
  subnet_id      = aws_subnet.public_subnetA.id
  network_acl_id = aws_network_acl.mainACL.id
}

resource "aws_network_acl_association" "public_subnetB_nacl_assoc" {
  subnet_id      = aws_subnet.public_subnetB.id
  network_acl_id = aws_network_acl.mainACL.id
}

# OUTPUT
output "public_subnetA" {
  value = aws_subnet.public_subnetA.id
}

output "public_subnetB" {
  value = aws_subnet.public_subnetB.id
}

output "private_subnetC" {
  value = aws_subnet.private_subnetC.id
}
output "private_subnetD" {
  value = aws_subnet.private_subnetD.id
}

output "private_subnetE" {
  value = aws_subnet.private_subnetE.id
}

output "private_subnetF" {
  value = aws_subnet.private_subnetF.id
}

output "vpc_id" {
    value = aws_vpc.my_vpc.id
}