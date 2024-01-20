terraform {
  required_version = "~> 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.32.1"
    }
  }

  backend "s3" {
    bucket         = var.s3_bucket
    key            = var.s3_key
    region         = var.s3_aws_region
    encrypt        = true
    dynamodb_table = var.dynamodb_table
  }
}

provider "aws" {
  region = var.default_aws_region
}
