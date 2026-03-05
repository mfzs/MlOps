terraform {
  required_providers {
    godaddy = {
      source  = "n3integration/godaddy"
      version = ">= 1.9.0"
    }
  }
}

resource "godaddy_domain_record" "this" {
  domain = var.domain

  record {
    name = var.record_name
    type = var.record_type
    data = var.record_data
    ttl  = var.record_ttl
  }
}
