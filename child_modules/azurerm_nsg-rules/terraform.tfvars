nsg_rules = {

  ssh = {

    name                        = "Allow-SSH"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    resource_group_name         = "shiva_rg3"
    network_security_group_name = "shivansg3"

  }

  http = {

    name                        = "Allow-HTTP"
    priority                    = 110
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    resource_group_name         = "shiva_rg3"
    network_security_group_name = "shivansg3"

  }

  https = {

    name                        = "Allow-HTTPS"
    priority                    = 120
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    resource_group_name         = "shiva_rg3"
    network_security_group_name = "shivansg3"

  }

}