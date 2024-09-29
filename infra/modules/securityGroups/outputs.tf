output "alb-sg-id" {
    value = aws_security_group.alb-sg.id
}

output "service-sg-id" {
    value = aws_security_group.service-sg.id
}