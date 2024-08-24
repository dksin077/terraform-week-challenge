terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
  access_key = "xyz"  
  secret_key = "abc-xyz"
}
