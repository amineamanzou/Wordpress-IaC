variable "secg_lb_id" {
  description = "SG ID for lb"
  type        = string
}

variable "secg_app_id" {
  description = "SG ID for app EC2"
  type        = string
}

variable "secg_db_id" {
  description = "SG ID for db EC2"
  type        = string
}

variable "secg_ssh_id" {
  description = "SG ID for ssh EC2"
  type        = string
}

variable "subnets" {
  description = "Subnets for EC2"
  type        = list(string)
}

variable "ec2_names" {
  description = "EC2 names"
  type        = list(string)
  default     = ["app1", "app2"]
}
