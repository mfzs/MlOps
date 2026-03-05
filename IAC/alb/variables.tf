variable "alb_name" {
  description = "The name of the ALB."
  type        = string
}

variable "internal" {
  description = "Whether the ALB is internal."
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "A list of security group IDs."
  type        = list(string)
}

variable "subnets" {
  description = "A list of subnet IDs."
  type        = list(string)
}

variable "listener_port" {
  description = "The port for the listener."
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "The protocol for the listener."
  type        = string
  default     = "HTTP"
}

variable "target_group_arn" {
  description = "The ARN of the default target group to forward traffic to."
  type        = string
}

variable "tags" {
  description = "A map of tags."
  type        = map(string)
  default     = {}
}
