resource "azurerm_network_security_group" "main" {
  name                = "${var.prefix}-network-sg"
  resource_group_name = "${azurerm_resource_group.main.name}"
  location            = "${var.location}"
}

resource "azurerm_network_security_rule" "ssh_inbound" {
  name                        = "ssh-sg"
  priority                    = 201
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.main.name}"
  network_security_group_name = "${azurerm_network_security_group.main.name}"
}

resource "azurerm_network_security_rule" "ftp_20_inbound" {
  name                        = "ftp-20-in-sg"
  priority                    = 202
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "20"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.main.name}"
  network_security_group_name = "${azurerm_network_security_group.main.name}"
}

# resource "azurerm_network_security_rule" "ftp_20_outbound" {
#   name                        = "ftp-20-out-sg"
#   priority                    = 202
#   direction                   = "Outbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "20"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = "${azurerm_resource_group.main.name}"
#   network_security_group_name = "${azurerm_network_security_group.main.name}"
# }

resource "azurerm_network_security_rule" "ftp_21_inbound" {
  name                        = "ftp-21-in-sg"
  priority                    = 203
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "21"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.main.name}"
  network_security_group_name = "${azurerm_network_security_group.main.name}"
}

# resource "azurerm_network_security_rule" "ftp_21_outbound" {
#   name                        = "ftp-21-out-sg"
#   priority                    = 203
#   direction                   = "Outbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "21"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = "${azurerm_resource_group.main.name}"
#   network_security_group_name = "${azurerm_network_security_group.main.name}"
# }

resource "azurerm_network_security_rule" "http_inbound" {
  name                        = "http-in-sg"
  priority                    = 204
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.main.name}"
  network_security_group_name = "${azurerm_network_security_group.main.name}"
}

resource "azurerm_network_security_rule" "http_outbound" {
  name                        = "http-out-sg"
  priority                    = 204
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.main.name}"
  network_security_group_name = "${azurerm_network_security_group.main.name}"
}

resource "azurerm_network_security_rule" "https_inbound" {
  name                        = "https-in-sg"
  priority                    = 205
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.main.name}"
  network_security_group_name = "${azurerm_network_security_group.main.name}"
}

resource "azurerm_network_security_rule" "https_outbound" {
  name                        = "https-out-sg"
  priority                    = 205
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.main.name}"
  network_security_group_name = "${azurerm_network_security_group.main.name}"
}

resource "azurerm_network_security_rule" "deny_all_inbound" {
  name                        = "deny-in"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.main.name}"
  network_security_group_name = "${azurerm_network_security_group.main.name}"
}

resource "azurerm_network_security_rule" "deny_all_outbound" {
  name                        = "deny-out"
  priority                    = 1000
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.main.name}"
  network_security_group_name = "${azurerm_network_security_group.main.name}"
}
