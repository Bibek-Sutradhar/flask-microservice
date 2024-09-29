variable "project-name"{
    type    = string
    default = "py-ecs-app"
}

variable "vpc-cidr"{
    type    = string
    default = "10.0.0.0/24"
}

variable "az-1"{
    type    = string
    default = "ap-south-1a" 
}

variable "public-subnet-a-cidr"{
    type    = string
    default = "10.0.0.64/26" 
}

variable "az-2"{
    type    = string
    default = "ap-south-1b" 
}

variable "public-subnet-b-cidr"{
    type    = string
    default = "10.0.0.128/26" 
}

variable "private-subnet-a-cidr"{
    type    = string
    default = "10.0.0.0/26"
}