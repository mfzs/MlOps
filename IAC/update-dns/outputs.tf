output "domain" {
  description = "The updated domain."
  value       = godaddy_domain_record.this.domain
}
