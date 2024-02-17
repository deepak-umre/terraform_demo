resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    =  ["var.aws_lb_test_security_groups"]
  subnets            = ["var.subnets"]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
  depends_on = [aws_security_group.lb]
}

resource "aws_security_group" "lb" {
  name        = "allow_tomcat"
  description = "Allow Tomcat inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_tomcat"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tomcat_ipv4" {
  security_group_id = aws_security_group.lb.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}


resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}


resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = var.target_id
  port             = "8080"
}

resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.test.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}
resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.test.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }

  condition {
    path_pattern {
      values = ["/student"]
    }
  }
}
