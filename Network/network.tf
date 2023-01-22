
resource "aws_vpc" "avsha_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs) == 1 ? 1 : length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.avsha_vpc.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.prefix}-SN-${count.index+1}"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.avsha_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.avsha_vpc.id
  tags = {
    Name = "${var.prefix}-igw"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "avsha_sg" {
  name        = "avsha_sg"
  description = "Avsha_SG"
  vpc_id      = aws_vpc.avsha_vpc.id

  ingress {
    description = "ssh_in"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  ingress {
    description = "80_in"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
#extract my ip to var
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}