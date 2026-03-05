variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "igw_name" {
  description = "The name of the Internet Gateway."
  type        = string
}

variable "tags" {
  description = "A map of tags to add to the IGW."
  type        = map(string)
  default     = {}
}
