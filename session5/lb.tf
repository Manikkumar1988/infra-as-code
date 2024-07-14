resource "aws_lb" "lb" {
  name               = "${var.prefix}-lb"
  load_balancer_type = "application"
  internal           = false

  security_groups = [aws_security_group.lb_sg.id]
  subnets         = module.vpc.public_subnets

  enable_deletion_protection = true

  tags = {
    Name = "${var.prefix}-lb"
  }
}


resource "aws_security_group" "lb_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8000
    to_port   = 8000
    protocol  = "tcp"
    self      = true
  }

  egress {
    description      = "Allow outgoing traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}


resource "aws_lb_target_group" "tg" {
  name        = "${var.prefix}-tg"
  port        = 8000
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "ip"
  health_check {
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    interval            = "30"
    matcher             = "200,302"
    path                = "/users"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}