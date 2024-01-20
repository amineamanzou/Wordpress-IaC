variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDRS"
  type        = list(string)
}

variable "s3_bucket" {
  description = "S3 bucket for Terraform backend state"
  type        = string
}

variable "s3_key" {
  description = "S3 key for Terraform backend state"
  type        = string
}

variable "s3_aws_region" {
  description = "AWS region of the S3 backend"
  type        = string
}

variable "dynamodb_table" {
  description = "DynamoDB table name for Terraform state locking"
  type        = string
}

variable "default_aws_region" {
  description = "Default AWS region"
  type        = string
}
