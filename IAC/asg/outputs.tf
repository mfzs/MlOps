output "asg_id" {
  description = "The autoscaling group id"
  value       = aws_autoscaling_group.this.id
}

output "asg_arn" {
  description = "The ARN for this AutoScaling Group"
  value       = aws_autoscaling_group.this.arn
}
