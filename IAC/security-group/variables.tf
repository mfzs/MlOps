variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "sg_name" {
  description = "The name of the Security Group."
  type        = string
}

variable "sg_description" {
  description = "The description of the Security Group."
  type        = string
  default     = "Managed by Terraform"
}

variable "ingress_rules" {
  description = "List of ingress rules."
  type        = any
  default     = []
}

variable "egress_rules" {
  description = "List of egress rules."
  type        = any
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "tags" {
  description = "A map of tags."
  type        = map(string)
  default     = {}
}
