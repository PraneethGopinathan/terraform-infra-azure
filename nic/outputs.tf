output "nic_id" {
  value       = [for nic in azurerm_network_interface.nic : nic.id]
  description = "The IDs of the NICs created"
}
output "public_ip_id" {
  value       = [for ip in azurerm_public_ip.public_ip : ip.id]
  description = "The IDs of the public IPs created"
}

