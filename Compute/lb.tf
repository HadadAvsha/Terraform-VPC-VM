resource "aws_lb" "lb" {
  count = length(aws_instance.vm) >= 2 ? 1 : 0
  name               = "${var.prefix}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.SG_id]
  subnets            = [for subnet in var.subnets_name : subnet.id]

  enable_deletion_protection = false

}

resource "aws_lb_listener" "front_end" {
  count = length(aws_instance.vm) >= 2 ? 1 : 0
  load_balancer_arn = aws_lb.lb[count.index].arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target[count.index].arn
  }
  tags = {
    Name = "${var.prefix}-listner"
  }
}

resource "aws_lb_target_group" "lb_target" {
  count = length(aws_instance.vm) >= 2 ? 1 : 0
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  tags = {
    Name = "${var.prefix}-target"
  }
}

resource "aws_lb_target_group_attachment" "lb_attach" {
  count = length(aws_instance.vm) == 1 ? 0 : length(aws_instance.vm)
  target_group_arn = element(aws_lb_target_group.lb_target[*].arn, count.index)
  target_id        = element(aws_instance.vm[*].id, count.index)
  port             = 80
#  depends_on       = [aws_instance]
}
