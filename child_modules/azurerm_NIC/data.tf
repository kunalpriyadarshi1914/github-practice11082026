data "azurerm_subnet" "subnetex" {
  for_each = var.nics
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.nic_rg
}

data "azurerm_public_ip" "pipex" {
  for_each = var.nics
  name                = each.value.pip_name
  resource_group_name = each.value.nic_rg
}