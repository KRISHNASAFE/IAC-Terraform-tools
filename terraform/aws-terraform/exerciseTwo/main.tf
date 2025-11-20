provider "aws" {
    region = "us-east-1"
}

variable "ami_id" {
    description="ami id value for instance dev"
}

variable "instance_type" {
    description="details about type of instance used for dev"
}

variable "project" {
    description="name of project"
    default="demo"
}

resource "aws_instance" "dev_web"{
    ami=var.ami_id
    instance_type=var.instance_type
}

resource "aws_s3_bucket" "bucket" {
    bucket="${var.project}-bucket"

    tags={
        Name="${var.project}-s3-bucket"
    }
}

resource "aws_vpc" "main" {
    cidr_block="10.0.0.0/16"
    enable_dns_hostnames=true

    tags={
        Name="${var.project}-vpc"
    }
}

resource "aws_internet_gateway" "igw"{
    vpc_id=aws_vpc.main.id

    tags={
        Name="${var.project}-igw"
    }

}

