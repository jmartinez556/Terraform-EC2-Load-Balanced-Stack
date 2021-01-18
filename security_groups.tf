
resource "aws_security_group" "load_balancer" {
  name        = var.security_group1_name
  description = "Allow internet traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "inbound_internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "secure_inbound_internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "load_balancer_traffic_control"
  }
}
resource "aws_security_group" "ec2" {
  name        = var.security_group1_name
  description = "Allow internet traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "security_group_for_ec2"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.load_balancer.id]
  }

  egress {
    description = "outbound_traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2"
  }
}
