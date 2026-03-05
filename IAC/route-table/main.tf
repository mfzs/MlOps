resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = var.rt_name
    },
    var.tags
  )
}

resource "aws_route" "this" {
  for_each = var.routes

  route_table_id            = aws_route_table.this.id
  destination_cidr_block    = each.value.destination_cidr_block
  gateway_id                = lookup(each.value, "gateway_id", null)
  nat_gateway_id            = lookup(each.value, "nat_gateway_id", null)
  transit_gateway_id        = lookup(each.value, "transit_gateway_id", null)
  vpc_peering_connection_id = lookup(each.value, "vpc_peering_connection_id", null)
}

resource "aws_route_table_association" "this" {
  count          = length(var.subnet_ids)
  subnet_id      = var.subnet_ids[count.index]
  route_table_id = aws_route_table.this.id
}
