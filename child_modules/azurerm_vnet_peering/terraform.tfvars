peerings = {
  vnet1_to_vnet2 = {
    name                         = "peering-shivavnet3-to-shivavnet4"
    resource_group_name          = "shiva_rg3"
    virtual_network_name         = "shivavnet3"
    remote_virtual_network_id    = "/subscriptions/dd2fe2ae-28d1-4517-b12b-b56258ece7d8/resourceGroups/shiva_rg4/providers/Microsoft.Network/virtualNetworks/shivavnet4"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
  vnet2_to_vnet1 = {
    name                         = "peering-shivavnet4-to-shivavnet3"
    resource_group_name          = "shiva_rg4"
    virtual_network_name         = "shivavnet4"
    remote_virtual_network_id    = "/subscriptions/dd2fe2ae-28d1-4517-b12b-b56258ece7d8/resourceGroups/shiva_rg3/providers/Microsoft.Network/virtualNetworks/shivavnet3"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}