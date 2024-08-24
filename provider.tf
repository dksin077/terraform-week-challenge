terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
  backend "s3" {
    bucket = "aws-s3-bucket-24082024"  # bucket should be existed
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "dynamodb_db_24082024" # dynamodb should be existed
  }
}