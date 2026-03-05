variable "name_prefix" {
  description = "Prefix for the launch template and instances."
  type        = string
}

variable "image_id" {
  description = "The AMI ID."
  type        = string
}

variable "instance_type" {
  description = "The instance type."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The SSH key name."
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "A list of security group IDs."
  type        = list(string)
}

variable "user_data" {
  description = "The user data script."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags."
  type        = map(string)
  default     = {}
}
