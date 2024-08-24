terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
<<<<<<< HEAD
  backend "s3" {
    bucket = "aws-s3-bucket-24082024"  # bucket should be existed
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "dynamodb_db_24082024" # dynamodb should be existed
  }
}
=======
}
provider "aws" {
  region = "ap-south-1"
  access_key = "xyz"  
  secret_key = "abc-xyz"
}
>>>>>>> cd96dcddd1da1c462a1f2cb0e7007e0fa4e60a0a
