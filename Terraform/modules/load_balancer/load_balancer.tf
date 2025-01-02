# Create ALB
resource "aws_lb" "LoadBalancer" {
  name               = "LoadBalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = [var.public_subnetA, var.public_subnetB]

  enable_deletion_protection = false # disable Deletion protection option

  tags = {
    Name = "LoadBalancer"
  }
}

# Create Target Group
resource "aws_lb_target_group" "tg" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id      = var.vpc_id

  tags = {
    Name = "TargetGroup"
  }
}

# Attach ALB to Target Group
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.LoadBalancer.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
      target_group_arn = aws_lb_target_group.tg.arn
  }

  tags = {
    Name = "HTTPListener"
  }
}

# Register EC2 Instances as Targets
resource "aws_lb_target_group_attachment" "frontend_a" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id        = var.frontend_a
    port             = 8080
}

resource "aws_lb_target_group_attachment" "frontend_b" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id        = var.frontend_b
    port             = 8080
}
