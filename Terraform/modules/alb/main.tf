# ALB
resource "aws_lb" "my-lb" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.secg_lb_id]
  subnets            = var.subnets

  enable_deletion_protection = true

  tags = {
    Name = "my-lb"
  }
}

# Listener
resource "aws_lb_listener" "lb_ls" {
  load_balancer_arn = aws_lb.my-lb.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy = 
  #certificate_arn = 

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg.arn
  }
}

# Target group
resource "aws_lb_target_group" "lb_tg" {
  name     = "lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Target group attachment
resource "aws_lb_target_group_attachment" "lb_tga" {
  count            = length(var.instances)
  target_group_arn = aws_lb_target_group.lb_tg.arn
  target_id        = var.instances[count.index]
  port             = 80
}

