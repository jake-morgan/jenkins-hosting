resource "azurerm_dns_a_record" "jenkins_record" {
  name                = "jenkins"
  zone_name           = "${var.domain_name}"
  resource_group_name = "dns"
  ttl                 = 60
  records             = ["${azurerm_public_ip.main.ip_address}"]
  depends_on          = ["azurerm_public_ip.main"]
}
