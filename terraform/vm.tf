resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  resource_group_name = "${azurerm_resource_group.main.name}"
  location            = "${var.location}"

  ip_configuration {
    name                          = "${var.prefix}-ip"
    subnet_id                     = "${azurerm_subnet.internal.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.main.id}"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  resource_group_name   = "${azurerm_resource_group.main.name}"
  location              = "${var.location}"
  vm_size               = "${var.vm_size}"
  network_interface_ids = ["${azurerm_network_interface.main.id}"]

  storage_image_reference {
    publisher = "${var.os_publisher}"
    offer     = "${var.os_offer}"
    sku       = "${var.os_sku}"
    version   = "${var.os_version}"
  }

  storage_os_disk {
    name              = "${var.prefix}-os-disk"
    create_option     = "${var.os_disk_create_option}"
    caching           = "${var.os_disk_caching_type}"
    managed_disk_type = "${var.os_disk_managed_disk_type}"
  }

  os_profile {
    computer_name  = "${var.prefix}-vm"
    admin_username = "${var.admin_username}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      key_data = "${file("~/.ssh/${var.prefix}.pub")}"
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
    }
  }

  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
}
