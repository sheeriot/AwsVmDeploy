output "vm0_ipaddress" {
    value = azurerm_public_ip.outsideip.ip_address
}
output "vm0_fqdn" {
    value = azurerm_public_ip.outsideip.fqdn
}
output "pubkey1" {
    value = file("${path.module}/pubkeys/${var.pubkey1_file}")
}