## --------------------------------
## ALB
## --------------------------------


## Create LB and TG

resource "aws_lb" "main" {
  name            = "bg-load-balancer"
  subnets         = aws_subnet.public.*.id
  security_groups = ["${aws_security_group.lb.id}"]
}

resource "aws_alb_target_group" "http-echo" {
  name        = "bg-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

## Redirect all traffic from the ALB to the target group
resource "aws_lb_listener" "front_end_fwd" {
  load_balancer_arn = aws_lb.main.id
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_iam_server_certificate.bg-cert.arn

  default_action {
    target_group_arn = aws_alb_target_group.http-echo.id
    type             = "forward"
  }
}

## HTTP to HTTPS redirection
resource "aws_lb_listener" "front_end_redir" {
  load_balancer_arn = aws_lb.main.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
