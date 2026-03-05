resource "aws_lb_target_group" "this" {
  name     = var.tg_name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id

  dynamic "health_check" {
    for_each = length(keys(var.health_check)) > 0 ? [var.health_check] : []
    content {
      path                = lookup(health_check.value, "path", "/")
      protocol            = lookup(health_check.value, "protocol", "HTTP")
      matcher             = lookup(health_check.value, "matcher", "200")
      interval            = lookup(health_check.value, "interval", 30)
      timeout             = lookup(health_check.value, "timeout", 5)
      healthy_threshold   = lookup(health_check.value, "healthy_threshold", 3)
      unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", 3)
    }
  }

  tags = merge(
    {
      "Name" = var.tg_name
    },
    var.tags
  )
}
