variable "vpc_id" {
  description = "The VPC ID where the subnets will be created."
  type        = string
}

variable "subnets" {
  description = "A map of subnet configurations. Key is the subnet name."
  type = map(object({
    cidr                    = string
    az                      = string
    map_public_ip_on_launch = optional(bool, false)
    tags                    = optional(map(string), {})
  }))
}

variable "tags" {
  description = "A map of common tags to add to all subnets."
  type        = map(string)
  default     = {}
}
