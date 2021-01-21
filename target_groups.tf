# TARGET GROUPS
resource "aws_lb_target_group" "tg" {
  name        = "${var.app_name}-${var.region}-tg"
  port        = var.port
  protocol    = var.protocol
  vpc_id      = aws_vpc.main.id
  target_type = "instance"
  health_check {
    enabled           = true
    matcher           = "200-304"
    protocol          = var.protocol
    path              = "/"
    timeout           = 60
    interval          = 61
    healthy_threshold = 2
  }
  tags = {
    name = "${var.app_name}-${var.region}-target-groups"
  }
}
