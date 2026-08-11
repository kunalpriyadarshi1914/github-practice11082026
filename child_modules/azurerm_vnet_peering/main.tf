variable "peerings" {}
resource "azurerm_virtual_network_peering" "peeringprac" {
  for_each                     = var.peerings
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  virtual_network_name         = each.value.virtual_network_name
  remote_virtual_network_id    = each.value.remote_virtual_network_id
  allow_virtual_network_access = lookup(each.value, "allow_virtual_network_access", true)
  allow_forwarded_traffic      = lookup(each.value, "allow_forwarded_traffic", false)
  allow_gateway_transit        = lookup(each.value, "allow_gateway_transit", false)
  use_remote_gateways          = lookup(each.value, "use_remote_gateways", false)
}