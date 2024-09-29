resource "aws_security_group" "alb-sg" {
    name        = "${var.project-name}-alb-sg"
    description = "This SG will enable HTTPS/HTTP access to Application Load balancer"
    vpc_id = var.vpc-id

    ingress {
        description = "HTTP Access"
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }

    ingress {
        description = "HTTPS Access"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "service-sg" {
    name        = "${var.project-name}-service-sg"
    description = "This SG will allow HTTPS/HTTP from ALB to service"
    vpc_id      = var.vpc-id

    ingress {
        description         = "HTTP Access"
        from_port           = "80"
        to_port             = "80"
        protocol            = "tcp"
        security_groups     = [aws_security_group.alb-sg.id]
    }

    ingress {
        description         = "HTTPS Access"
        from_port           = "443"
        to_port             = "443"
        protocol            = "tcp"
        security_groups     = [aws_security_group.alb-sg.id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    } 
}