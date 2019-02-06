resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  location            = "${var.location}"
  address_space       = ["10.1.0.0/16"]
  resource_group_name = "${azurerm_resource_group.main.name}"
}

resource "azurerm_public_ip" "main" {
  name                         = "${var.prefix}-pub-ip"
  resource_group_name          = "${azurerm_resource_group.main.name}"
  location                     = "${var.location}"
  public_ip_address_allocation = "Dynamic"
}

resource "azurerm_subnet" "internal" {
  name                 = "${var.prefix}-internal-subnet"
  resource_group_name  = "${azurerm_resource_group.main.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "10.1.0.0/24"
}

resource "azurerm_subnet_network_security_group_association" "main" {
  subnet_id                 = "${azurerm_subnet.internal.id}"
  network_security_group_id = "${azurerm_network_security_group.main.id}"
}
