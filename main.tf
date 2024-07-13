# Resource Group
module "resource_grp" {
  source   = "./resource-grp"
  grp_name = var.resource_grp_name
  location = var.location
  env      = var.env
}

# Networks and Security
module "vnet" {
  source            = "./vnet"
  vnet_name         = var.vnet_name
  location          = var.location
  env               = var.env
  resource_grp_name = var.resource_grp_name
  depends_on        = [module.resource_grp.resource_grp_id]
}

module "subnet" {
  source            = "./subnets"
  subnet_name       = var.subnet_name
  vnet_name         = var.vnet_name
  env               = var.env
  resource_grp_name = var.resource_grp_name
  depends_on        = [module.resource_grp.resource_grp_id, module.vnet.vnet_id]
}

module "nic" {
  source            = "./nic"
  vm_count          = var.vm_count
  vm_name           = var.vm_name
  nic_name          = var.nic_name
  public_ip_name    = var.public_ip_name
  subnet_id         = module.subnet.subnet_id
  public_ip_id      = module.nic.public_ip_id
  env               = var.env
  location          = var.location
  resource_grp_name = var.resource_grp_name
  depends_on        = [module.resource_grp.resource_grp_id, module.vnet.vnet_id, module.subnet.subnet_id, ]
}

# Storage
module "storage" {
  source                 = "./storage"
  storage_acnt_name      = var.storage_acnt_name
  resource_grp_name      = var.resource_grp_name
  location               = var.location
  storage_container_name = var.storage_container_name
  env                    = var.env
  depends_on             = [module.resource_grp.resource_grp_id]
}

# Compute
module "vm_linux" {
  source                       = "./vm-linux"
  vm_count                     = var.vm_count
  vm_name                      = var.vm_name
  location                     = var.location
  resource_grp_name            = var.resource_grp_name
  env                          = var.env
  vm_size                      = var.vm_size
  vm_username                  = var.vm_username
  vm_public_key_path           = var.vm_public_key_path
  vm_image_publisher           = var.vm_image_publisher
  vm_image_offer               = var.vm_image_offer
  vm_image_sku                 = var.vm_image_sku
  vm_image_version             = var.vm_image_version
  vm_os_disk_caching           = var.vm_os_disk_caching
  vm_os_disk_storage_acnt_type = var.vm_os_disk_storage_acnt_type
  nic_id                       = module.nic.nic_id
  depends_on                   = [module.resource_grp.resource_grp_id]
}

# # Database
# module "db" {
#   source            = "./database"
#   resource_grp_name = var.resource_grp_name
#   location          = var.location
#   env               = var.env
#   pg_server_name    = var.pg_server_name
#   pg_sku_name       = var.pg_sku_name
#   pg_database_name  = var.pg_database_name
#   username          = var.pg_username
#   password          = var.pg_password
#   size              = var.pg_size
#   # version           = var.pg_server_version
#   retention_days = var.pg_retention_days
#   depends_on     = [module.resource_grp.resource_grp_id]
# }
