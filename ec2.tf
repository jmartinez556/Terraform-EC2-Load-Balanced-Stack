# EC2 INSTANCE
resource "aws_instance" "ec2-instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  subnet_id                   = aws_subnet.private-1.id
  key_name                    = var.key_name
  associate_public_ip_address = true


  tags = {
    Name = "${var.region}-${var.app_name}-ec2-instance"
  }
}