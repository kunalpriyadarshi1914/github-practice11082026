resource "azurerm_network_interface" "nic" {
    for_each = var.nics
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.nic_rg

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.subnetex[each.key].id
    public_ip_address_id          =  data.azurerm_public_ip.pipex[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}