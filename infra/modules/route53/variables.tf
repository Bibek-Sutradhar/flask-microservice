variable "hosted-zone-id" {
    type    = string
    default = "Z04126233B2GCTJIG19PP"
}
variable "record-name" {
    type    = string
    default = "svc.cloudappsgb.com"
}

variable "alb-dns-name" {
    type    = string
    default = "py-ecs-app-alb-751326292.ap-south-1.elb.amazonaws.com"
}
variable "alb-zone-id" {
    type    = string
    default = "ZP97RAFLXTNZK"
}