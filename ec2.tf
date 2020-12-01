resource "aws_instance" "ec2-instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.allow_all_traffic.id]
  subnet_id                   = aws_subnet.public-1.id
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "Justins-ec2-instance"
  }
}