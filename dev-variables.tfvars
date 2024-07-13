# Variables.tf

client_secret   = "changeme"
client_id       = "changeme"
tenant_id       = "changeme"
subscription_id = "changeme"
location        = "Southeast Asia"
env             = "dev"

# Resource Group
resource_grp_name = "swarm-cluster"

# Storage Account
storage_acnt_name      = "swarmcluster"
storage_container_name = "swarm-container"

# Count
vm_count = 2

# VM
vm_public_key_path           = "~/.ssh/id_rsa.pub" # add your public key file path
vm_username                  = "praneeth"
public_ip_name               = "vm-public-ip"
vm_name                      = "swarm-node"
vm_size                      = "Standard_D4as_v5"
vm_os_disk_caching           = "ReadWrite"
vm_os_disk_storage_acnt_type = "StandardSSD_LRS"
vm_image_publisher           = "Canonical"
vm_image_offer               = "0001-com-ubuntu-server-jammy"
vm_image_sku                 = "22_04-lts-gen2"
vm_image_version             = "latest"

# Vnet
vnet_name = "vnet"

# Subnet
subnet_name = "subnet"

# NIC
nic_name = "nic"


# # PG Database
# pg_sku_name       = "GP_Gen5_2"
# pg_size           = 102400
# pg_retention_days = 27
# pg_server_version = 11

# # PG Server
# pg_server_name   = "changeme"
# pg_database_name = "changeme"
# pg_username      = "changeme"
# pg_password      = "changeme"
