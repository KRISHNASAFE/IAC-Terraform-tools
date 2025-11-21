provider "aws" {    
    region = "us-east-1"
}



resource "aws_instance" "demo_web" {
    ami = var.ami_id
    instance_type = var.instance_type

    tags = {
      Environment="dev"
    }
}

resource "aws_s3_bucket" "s3bucket" {
    bucket = "${var.project}-mys3bucket"

    tags = {
        Environment="dev"
    }
}

