variable "nsg_rules" {        
    description = "Map of NSG Rules"

  type = map(object({

    name                        = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    resource_group_name         = string
    network_security_group_name = string

    }))
           
}

  