
resource "aws_security_group" "allow_all_traffic" {
  name        = var.security_group1_name
  description = "Allow internet traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = var.ingress_rule_desc1
    from_port   = var.ingress_to_port1
    to_port     = var.ingress_from_port1
    protocol    = var.ingress_protocol1
    cidr_blocks = var.ingress_cidr_blocks1
  }

  egress {
    description = var.egress_rule_desc1
    from_port   = var.egress_from_port1
    to_port     = var.egress_to_port1
    protocol    = var.egress_protocol1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_traffic"
  }
}
