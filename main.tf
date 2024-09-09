module "vpc_routes" {
  source         = "./modules/vpc_routes"
  route_table_id = "rtb-04673f79b92fb25bc"
  default_transit_gateway_id      = "tgw-0010647b39c9f6bac"  # Your default Transit Gateway ID
  routes = [
    {
      destination_cidr_block   = "172.28.0.0/24"
      nat_gateway_id           = "nat-0a18af5f28415db4c"
    },
    {
      destination_cidr_block = "172.27.0.0/24"
    }
  ]
}
