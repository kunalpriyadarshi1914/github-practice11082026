
resource "azurerm_subnet_network_security_group_association" "nsga1" {
    for_each = var.nsg_association
   subnet_id                 = azurerm_subnet.subnet[each.value.subnet_name].id
  network_security_group_id = azurerm_network_security_group.nsg[each.value.nsg_name].id

}