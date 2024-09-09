
variable "route_table_id" {
  description = "The ID of the route table to add the routes to."
  type        = string
}

variable "routes" {
  description = "List of route configurations."
   type = list(object({
    destination_cidr_block      = string
    gateway_id                  = optional(string)
    nat_gateway_id              = optional(string)
    network_interface_id        = optional(string)
    vpc_peering_connection_id   = optional(string)
    transit_gateway_id          = optional(string)
    egress_only_gateway_id      = optional(string)
    ipv6_cidr_block             = optional(string)
    destination_ipv6_cidr_block = optional(string)
    carrier_gateway_id          = optional(string)
  }))
}

variable "default_transit_gateway_id" {
  description = "The Transit Gateway ID to be used by default if gateway_id is not provided"
  type        = string
   }
