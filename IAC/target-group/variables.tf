variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "tg_name" {
  description = "The name of the Target Group."
  type        = string
}

variable "port" {
  description = "The port for the target group."
  type        = number
  default     = 80
}

variable "protocol" {
  description = "The protocol for the target group."
  type        = string
  default     = "HTTP"
}

variable "health_check" {
  description = "Health check configuration."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags."
  type        = map(string)
  default     = {}
}
