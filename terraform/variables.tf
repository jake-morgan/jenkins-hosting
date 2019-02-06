variable "rg_name" {
  type    = "string"
  default = "testserver"
}

variable "location" {
  type    = "string"
  default = "North Europe"
}

variable "author" {
  type    = "string"
  default = "Jake"
}

variable "vm_size" {
  type    = "string"
  default = "Standard_B1ms"
}

variable "admin_username" {
  type = "string"
}

variable "prefix" {
  type    = "string"
  default = "jake-test"
}

variable "os_publisher" {
  type    = "string"
  default = "Canonical"
}

variable "os_sku" {
  type    = "string"
  default = "18.04-LTS"
}

variable "os_offer" {
  type    = "string"
  default = "UbuntuServer"
}

variable "os_version" {
  type    = "string"
  default = "latest"
}

variable "os_disk_create_option" {
  type    = "string"
  default = "FromImage"
}

variable "os_disk_caching_type" {
  type    = "string"
  default = "ReadOnly"
}

variable "os_disk_managed_disk_type" {
  type    = "string"
  default = "Standard_LRS"
}

variable "domain_name" {
  type    = "string"
  default = "jakemorgan.io"
}
