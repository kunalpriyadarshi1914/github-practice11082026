resource "azurerm_network_interface" "nic" {
    for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.location_name
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnetx[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pipex[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "linux_vm" {
    for_each = var.vms
  name                = each.value.vm-name
  resource_group_name = each.value.rg_name
  location            = each.value.location_name
  size                = each.value.size-name
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,]
  

 
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "Ubuntuserver"
    sku       = "22_04-lts"
    version   = "latest"
  }
}