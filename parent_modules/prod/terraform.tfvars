rgprac = {
  rgprac1 = {
    name     = "vmrg1-dev"
    location = "centralindia"
  }
  rgprac2 = {
    name     = "vmrg2-dev"
    location = "centralindia"
  }
}
vnetprac = {
  vnetsprac1 = {
    name                = "vmvnet1-dev"
    location            = "centralindia"
    resource_group_name = "vmrg1-dev"
    address_space       = ["10.0.0.0/16"]
  }
  vnetsprac2 = {
    name                = "vmvnet2-dev"
    location            = "centralindia"
    resource_group_name = "vmrg1-dev"
    address_space       = ["10.1.0.0/16"]
  }
}
subnetprac = {
  subnetsprac1 = {
    name                 = "vmsubnet1-dev"
    resource_group_name  = "vmrg1-dev"
    virtual_network_name = "vmvnet1-dev"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnetsprac3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "vmrg1-dev"
    virtual_network_name = "vmvnet1-dev"
    address_prefixes     = ["10.0.4.0/26"]
  }
  subnetsprac2 = {
    name                 = "vmsubnet2-dev"
    resource_group_name  = "vmrg1-dev"
    virtual_network_name = "vmvnet1-dev"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

vms = {
  vm1={
    nic_name                  = "vm1-nic"
    location-name             = "Central India"
    rg-name         =          "vmrg1-dev"
    subnet_name=          "vmsubnet1-dev"
    pip_name="vmpip1"

    ip_configuration_name         = "internal"
    virtual_network_name= "vmvnet1-dev"
    private_ip_address_allocation = "Dynamic"
    vm-name="shiva-vm1"
    size-name="Standard_B1s"
    admin_username ="Shiva_devops1914"
    admin_password="komalkunal@1914"
    
}
    vm2={
   nic_name                  = "vm2-nic"
   location-name             = "Central India"
    rg-name         =          "vmrg1-dev"
    subnet_name=          "vmsubnet1-dev"
    pip_name="vmpip2"

    ip_configuration_name         = "internal"
    virtual_network_name= "vmvnet1-dev"
    private_ip_address_allocation = "Dynamic"
    vm-name="shiva-vm2"
    size-name="Standard_B1s"
    admin_username ="Shiva_devops1914"
    admin_password="komalkunal@1914"
    

}
}


/* bastion_hostprac = {
    bastion_hostprac1={
        name="bastion-production1914"
        location="centralindia"
        resource_group_name="shiva_rg3"
        subnet_id="/subscriptions/586e3c12-b0f0-4c52-946a-ed23650f6c3a/resourceGroups/shiva_rg3-dev/providers/Microsoft.Network/virtualNetworks/shivavnet3-dev/subnets/AzureBastionSubnet"
        public_ip_address_id="/subscriptions/586e3c12-b0f0-4c52-946a-ed23650f6c3a/resourceGroups/shiva_rg3-dev/providers/Microsoft.Network/publicIPAddresses/bpip1914"
}
} */