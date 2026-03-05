variable "domain" {
  description = "The GoDaddy domain to update (e.g. example.com)."
  type        = string
}

variable "record_name" {
  description = "The name of the record (e.g. www, api)."
  type        = string
}

variable "record_type" {
  description = "The type of the record (e.g. A, CNAME, TXT)."
  type        = string
}

variable "record_data" {
  description = "The data/value the record should point to (e.g. ALB DNS name)."
  type        = string
}

variable "record_ttl" {
  description = "The TTL of the record."
  type        = number
  default     = 3600
}
