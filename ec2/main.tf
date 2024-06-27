variable "vpc_subnet_id" {
  description = "VPC subnet ID"
}

variable "sg_group_id" {
  description = "Security Group ID"
}

resource "aws_instance" "pointhub_api" {
    ami                         = "ami-003c463c8207b4dfa"
    instance_type               = "t2.micro"
    availability_zone           = "ap-southeast-1a"
    key_name                    = "pointhub_key"
    subnet_id                   = var.vpc_subnet_id
    vpc_security_group_ids      = [var.sg_group_id]
    associate_public_ip_address = true
    tags = {
        Name = "pointhub_api"
    }
}
resource "aws_instance" "pointhub_web" {
    ami                         = "ami-003c463c8207b4dfa"
    instance_type               = "t2.micro"
    availability_zone           = "ap-southeast-1a"
    key_name                    = "pointhub_key"
    subnet_id                   = var.vpc_subnet_id
    vpc_security_group_ids      = [var.sg_group_id]
    associate_public_ip_address = true
    tags = {
        Name = "pointhub_wev"
    }
}
resource "aws_instance" "pointhub_cms" {
    ami                         = "ami-003c463c8207b4dfa"
    instance_type               = "t2.micro"
    availability_zone           = "ap-southeast-1a"
    key_name                    = "pointhub_key"
    subnet_id                   = var.vpc_subnet_id
    vpc_security_group_ids      = [var.sg_group_id]
    associate_public_ip_address = true
    tags = {
        Name = "pointhub_cms"
    }
}
