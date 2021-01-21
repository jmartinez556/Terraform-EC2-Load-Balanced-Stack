# BALANCES ACROSS EC2 / DIRECTS TRAFFIC TO TARGET GROUPS
resource "aws_lb" "alb" {
  name               = "${var.region}-${var.app_name}-alb"
  internal           = "false"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer.id]
  subnets            = [aws_subnet.public-1.id, aws_subnet.public-2.id, aws_subnet.public-3.id]


  tags = {
    name = "${var.region}-${var.app_name}-load-balancer"
  }
}

resource "aws_lb_listener" "port-80-traffic" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_listener_rule" "port-80-rule" {
  listener_arn = aws_lb_listener.port-80-traffic.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  condition {
    host_header {
      values = [var.domain]
    }
  }
}
