
module "resource_group" {
  source = "../../child_modules/azurerm_resource_group"
  rgs    = var.rgprac

}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../child_modules/azurerm_vnet"
  vnets      = var.vnetprac

}
module "subnet" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../../child_modules/azurerm_subnet"
  subnets    = var.subnetprac

}
module "virtual_machine" {
  depends_on = [ module.subnet ]
  source = "../../child_modules/azurerm_virtual_machine"
  vms = var.vms
  
}

# module "nic" {
#   depends_on = [ module.resource_group ]
#   source = "../../child_modules/azurerm_NIC"
#   nics = var.nicex1914
  
# }
/* module "bastion_host" {
    source = "../../child_modules/azurerm_bastion"
    bastion_hosts = var.bastion_hostprac

} */


