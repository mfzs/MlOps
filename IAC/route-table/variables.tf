variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "rt_name" {
  description = "The name of the Route Table."
  type        = string
}

variable "routes" {
  description = "A map of route configurations."
  type = map(object({
    destination_cidr_block    = string
    gateway_id                = optional(string)
    nat_gateway_id            = optional(string)
    transit_gateway_id        = optional(string)
    vpc_peering_connection_id = optional(string)
  }))
  default = {}
}

variable "subnet_ids" {
  description = "A list of subnet IDs to associate with this route table."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to add to the Route Table."
  type        = map(string)
  default     = {}
}
