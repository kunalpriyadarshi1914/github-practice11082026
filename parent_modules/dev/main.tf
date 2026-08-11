module "resource_group" {
  source = "../../child_modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source = "../../child_modules/azurerm_vnet"
  vnets  = var.vnets
}
module "subnet" {
  depends_on = [ module.resource_group,module.virtual_network ]
  source  = "../../child_modules/azurerm_subnet"
  subnets = var.subnets

}
module "pip_name" {
  depends_on = [ module.resource_group ]
  source = "../../child_modules/azurerm_public_ip_address"
  pips = var.pips
  
}
module "virtual_machine" {
  depends_on = [ module.pip_name,module.subnet,module.virtual_network,module.resource_group ]
  source = "../../child_modules/azurerm_virtual_machine"
  vms    = var.vms
}



