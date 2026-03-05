variable "asg_name" {
  description = "The name of the ASG."
  type        = string
}

variable "min_size" {
  description = "The minimum size of the auto scaling group."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum size of the auto scaling group."
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group."
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(string)
}

variable "target_group_arns" {
  description = "A list of aws_alb_target_group ARNs, for use with Application or Network Load Balancing."
  type        = list(string)
  default     = []
}

variable "launch_template_id" {
  description = "The ID of the launch template."
  type        = string
}

variable "tags" {
  description = "A map of tags."
  type        = map(string)
  default     = {}
}
