terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.32.1"
    }
  }
  backend "s3" {
    bucket = "itart-terraform-backend"
    key = "state/terraform.tfstate"
    region = "eu-west-3"
    encrypt = true
    dynamodb_table = "state-lock"
  }
}

provider "aws" {
  region = "eu-west-3" 
}
