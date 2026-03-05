output "subnet_ids_map" {
  description = "A map of subnet names to their IDs."
  value       = { for k, v in aws_subnet.this : k => v.id }
}

output "subnet_ids" {
  description = "A list of subnet IDs."
  value       = [for subnet in aws_subnet.this : subnet.id]
}
