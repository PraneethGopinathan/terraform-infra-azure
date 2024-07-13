output "info" {
  value = {
    location = var.location
    env      = var.env
  }
}

output "ssh" {
  value = {
    for key, value in module.vm_linux.public_ip_address : "${var.vm_name}-${key + 1}" => "ssh ${var.vm_username}@${value}"
  }
}

