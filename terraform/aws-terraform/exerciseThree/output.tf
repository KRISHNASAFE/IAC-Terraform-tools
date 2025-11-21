output "instance_public_ip"  {
    value = aws_instance.demo-web.public_ip
}

output "aws_s3_bucket" {
    value = aws_s3_bucket.s3bucket.bucket
}