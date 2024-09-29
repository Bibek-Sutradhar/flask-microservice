variable "project-name" {
    type    = string
    default = "py-ecs-app"
}

variable "vpc-id" {
    type    = string
    default = "vpc-085988a99b183ca23"
}

variable "public-subnet-a-id" {
    type    = string
    default = "subnet-09a1ae7e45e81faa3" 
}

variable "public-subnet-b-id" {
    type    = string
    default = "subnet-0163e0f392fb6a7b7" 
}

variable "alb-sg-id" {
    type    = string
    default = "sg-0441a54864ed60245"
}