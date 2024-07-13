resource "azurerm_linux_virtual_machine" "swarm_nodes" {
  count                 = var.vm_count
  name                  = "${var.vm_name}-${count.index + 1}"
  resource_group_name   = var.resource_grp_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.vm_username
  network_interface_ids = [var.nic_id[count.index]]



  os_disk {
    caching              = var.vm_os_disk_caching
    storage_account_type = var.vm_os_disk_storage_acnt_type
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  admin_ssh_key {
    username   = var.vm_username
    public_key = file("${var.vm_public_key_path}")
  }

  tags = {
    Environment = var.env
  }
}

resource "azurerm_managed_disk" "data_disk" {
  count                = var.vm_count
  name                 = "swarm-node-${count.index + 1}-datadrive"
  location             = var.location
  resource_group_name  = var.resource_grp_name
  storage_account_type = var.vm_os_disk_storage_acnt_type
  create_option        = "Empty"
  disk_size_gb         = 200
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count              = var.vm_count
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.swarm_nodes[count.index].id
  lun                = 1
  caching            = "ReadWrite"
}
