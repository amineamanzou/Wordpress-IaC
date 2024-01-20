variable "secg_lb_id" {
  description = "SG ID for Application Load Balancer"
  type        = string
}

variable "subnets" {
  description = "Subnets for ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC for ALB"
  type        = string
}

variable "instances" {
  description = "Instances for TGA"
  type        = list(string)
}
