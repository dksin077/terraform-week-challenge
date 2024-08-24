resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.buckte_name
  tags = {
    Name = "s3_bucket_1"
    Environment = "prod"
  }
}