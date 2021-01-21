# LAUNCH TEMPLATE
resource "aws_launch_template" "launch_template" {
  name                   = "${var.region}-${var.app_name}-launch-template"
  image_id               = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2.id]


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.region}-${var.app_name}-launch-template"
    }
  }
}
