resource "null_resource" "docker_setup" {
  count = var.vm_count
  provisioner "file" {
    source      = "/home/praneeth/Documents/repos/genpro/disease-context-center/deployment/terraform/vm-linux/install_docker.sh" # full path to script file
    destination = "/tmp/install_docker.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install_docker.sh",
      "sudo /tmp/install_docker.sh"
    ]
  }
  connection {
    type = "ssh"
    user = var.vm_username
    host = azurerm_linux_virtual_machine.swarm_nodes[count.index].public_ip_address
  }
}
