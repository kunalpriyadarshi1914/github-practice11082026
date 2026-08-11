
resource "azurerm_nat_gateway" "ng" {
    for_each = var.ngs
  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
 }
resource "azurerm_public_ip" "pip" {
    for_each = var.pips
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}
resource "azurerm_nat_gateway_public_ip_association" "pipassociation" {
    for_each = var.pipassociations
  nat_gateway_id       = azurerm_nat_gateway.ng[each.value.nat_gateway].id
  public_ip_address_id = azurerm_public_ip.pip[each.value.public_ip].id
}