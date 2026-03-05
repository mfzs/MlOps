resource "aws_subnet" "this" {
  for_each = var.subnets

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = lookup(each.value, "map_public_ip_on_launch", false)

  tags = merge(
    {
      "Name" = each.key
    },
    var.tags,
    lookup(each.value, "tags", {})
  )
}
