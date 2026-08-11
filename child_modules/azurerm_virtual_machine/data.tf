data "azurerm_subnet" "subnetx" {
    for_each = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.rg_name
}
data "azurerm_public_ip" "pipex" {
    for_each = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
