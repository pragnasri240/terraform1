variable "aws_region" {
  description = "AWS region to deploy IAM resources"
  type        = string
  default     = "ap-south-1"
}

variable "user_name" {
  description = "IAM user name"
  type        = string
  default     = "dev-user"
}

variable "group_name" {
  description = "IAM group name"
  type        = string
  default     = "developers"
}

variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = "ec2-role"
}

variable "policy_name" {
  description = "Custom IAM policy name"
  type        = string
  default     = "S3FullAccessPolicy"
}
