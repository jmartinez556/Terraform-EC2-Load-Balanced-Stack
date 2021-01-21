resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.region}-${var.app_name}-vpc-main"
  }
}


# INTERNET GATEWAY
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.region}-${var.app_name}-internet-gateway"
  }
}

# PUBLIC SUBNETS
resource "aws_subnet" "public-1" {
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_1_cidr_block

  tags = {
    Name = "${var.region}-${var.app_name}-public-subnets"
  }
}
resource "aws_subnet" "public-2" {
  availability_zone = "${var.region}b"
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_2_cidr_block

  tags = {
    Name = "${var.region}-${var.app_name}-public-subnets"
  }
}
resource "aws_subnet" "public-3" {
  availability_zone = "${var.region}c"
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_3_cidr_block

  tags = {
    Name = "${var.region}-${var.app_name}-public-subnets"
  }
}

# PUBLIC ROUTE TABLE
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "${var.region}-${var.app_name}-public-route-table"
  }
}

# PUBLIC ROUTE TABLE ASSOCIATIONS
resource "aws_route_table_association" "rta-public-1" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "rta-public-2" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "rta-public-3" {
  subnet_id      = aws_subnet.public-3.id
  route_table_id = aws_route_table.public-rt.id
}

# PRIVATE SUBNETS
resource "aws_subnet" "private-1" {
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_1_cidr_block

  tags = {
    Name = "${var.region}-${var.app_name}-private-subnets"
  }
}
resource "aws_subnet" "private-2" {
  availability_zone = "${var.region}b"
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_2_cidr_block

  tags = {
    Name = "${var.region}-${var.app_name}-private-subnets"
  }
}
resource "aws_subnet" "private-3" {
  availability_zone = "${var.region}c"
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_3_cidr_block

  tags = {
    Name = "${var.region}-${var.app_name}-private-subnets"
  }
}

#PRIVATE ROUTE TABLE
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "${var.region}-${var.app_name}-private-route-table"
  }
}

# PRIVATE ROUTE TABLES ASSOCIATIONS
resource "aws_route_table_association" "rta-private-1" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "rta-private-2" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "rta-private-3" {
  subnet_id      = aws_subnet.private-3.id
  route_table_id = aws_route_table.private-rt.id
}


# NAT GATEWAY           * LOCATED IN THE PUBLIC SUBNET TO COMMUNICATE WITH THE PRIVATE SUBNET *
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-1.id
  tags = {
    Name = "${var.region}-${var.app_name}-nat-gateway"
  }
}

#
resource "aws_eip" "nat" {
  vpc = true
}
