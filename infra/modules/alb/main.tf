resource "aws_lb" "alb" {
    name                = "${var.project-name}-alb"
    internal            = false
    load_balancer_type  = "application"
    security_groups     = [var.alb-sg-id]
    subnets             = [var.public-subnet-a-id, var.public-subnet-b-id]
}

resource "aws_lb_target_group" "alb-tg" {
    name        = "${var.project-name}-target-group"
    port        = 80
    protocol    = "HTTP"
    vpc_id      = var.vpc-id
}

resource "aws_lb_listener" "alb-https-listener" {
    load_balancer_arn   = aws_lb.alb.arn
    port                = "443"
    protocol            = "HTTPS"
    ssl_policy          = "ELBSecurityPolicy-2016-08"
    certificate_arn     = aws_acm_certificate.cert.arn

    default_action {
        type                = "forward"
        target_group_arn    = aws_lb_target_group.alb-tg.arn
    }
}

resource "aws_lb_listener" "alb-http-listener" {
    load_balancer_arn   = aws_lb.alb.arn
    port                = "80"
    protocol            = "HTTP"

    default_action {
        type                = "forward"
        target_group_arn    = aws_lb_target_group.alb-tg.arn
    }
}

#to be updated after Route53 configuration
resource "aws_acm_certificate" "cert" {
  domain_name       = "svc.cloudappsgb.com"
  validation_method = "DNS"

  validation_option {
    domain_name       = "svc.cloudappsgb.com"
    validation_domain = "cloudappsgb.com"
  }
}
