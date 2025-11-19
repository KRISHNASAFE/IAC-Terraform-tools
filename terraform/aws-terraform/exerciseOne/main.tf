# Variables
variable "ami_id" {
    description = "Value of ami for dev web vm"
}

variable "instance_type" {
    description = "Mention instance type for dev env."
}


provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "dev-web" {
    ami = var.ami_id
    instance_type = var.instance_type
}

