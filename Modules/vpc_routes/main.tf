resource "aws_route" "vpc_routes" {
  for_each = { for idx, route in var.routes : idx => route }

  route_table_id         = var.route_table_id
  destination_cidr_block = each.value.destination_cidr_block
 # Only assign transit_gateway_id if present in the routes map, otherwise fallback to default
  transit_gateway_id = lookup(each.value, "transit_gateway_id", var.default_transit_gateway_id)
  # Assign each possible route target conditionally
  gateway_id                = lookup(each.value, "gateway_id", null)
  nat_gateway_id            = lookup(each.value, "nat_gateway_id", null)
  network_interface_id      = lookup(each.value, "network_interface_id", null)
  vpc_peering_connection_id = lookup(each.value, "vpc_peering_connection_id", null)
  egress_only_gateway_id    = lookup(each.value, "egress_only_gateway_id", null)
  carrier_gateway_id        = lookup(each.value, "carrier_gateway_id", null)

 

  # Optional IPv6 CIDR blocks
    destination_ipv6_cidr_block = lookup(each.value, "destination_ipv6_cidr_block", null)
}
