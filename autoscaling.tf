# AUTOSCALING GROUP
resource "aws_autoscaling_group" "bar" {
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size
  vpc_zone_identifier = [
    aws_subnet.private-1.id,
    aws_subnet.private-2.id,
  aws_subnet.private-3.id]
  target_group_arns = [
  aws_lb_target_group.tg.id]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
  tag {
    key                 = "name"
    propagate_at_launch = false
    value               = "${var.region}-${var.app_name}-autoscaling-group"
  }
}
