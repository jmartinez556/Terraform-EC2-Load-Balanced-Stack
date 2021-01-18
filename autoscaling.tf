resource "aws_launch_template" "launch_template" {
  name                   = var.launch_template_name
  image_id               = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_all_traffic.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name              = "Justins-launch-template"
      Deployment_Method = "Terraform"
    }
  }
}
resource "aws_lb_target_group" "target_group" {
  name     = "Justins-target-group"
  port     = var.port
  protocol = var.protocol
  vpc_id   = aws_vpc.main.id
  health_check {
    enabled           = true
    matcher           = "200-304"
    protocol          = var.protocol
    path              = "/"
    timeout           = 30
    interval          = 31
    healthy_threshold = 2
  }
}
resource "aws_autoscaling_group" "bar" {
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = [aws_subnet.private-1.id]
  target_group_arns   = [aws_lb_target_group.target_group.id]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}
