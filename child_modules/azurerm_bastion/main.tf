resource "azurerm_bastion_host" "bastion_hostsprac" {
    for_each = var.bastion_hosts
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = each.value.subnet_id
    public_ip_address_id = each.value.public_ip_address_id
  }
}