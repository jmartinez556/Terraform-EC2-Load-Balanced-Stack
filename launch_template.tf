# LAUNCH TEMPLATE
resource "aws_launch_template" "launch_template" {
  name                   = var.launch_template_name
  image_id               = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2.id]


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name              = "Justins-launch-template"
      Deployment_Method = "Terraform"
    }
  }
}
