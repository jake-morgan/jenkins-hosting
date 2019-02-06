output "ssh" {
  value = "ssh ${var.admin_username}@${azurerm_public_ip.main.ip_address}"
}
