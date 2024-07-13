output "public_ip_address" {
  value = {
    for idx, vm in azurerm_linux_virtual_machine.swarm_nodes : idx => vm.public_ip_address
  }
}
