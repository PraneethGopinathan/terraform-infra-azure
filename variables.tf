# Common Variables
variable "client_secret" {
  type        = string
  description = "Client secret for Azure Authentication"
}

variable "client_id" {
  type        = string
  description = "Client ID of Azure Subscription"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID of Azure Subscription"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "location" {
  type        = string
  description = "Region"
}

variable "env" {
  type        = string
  description = "Environment that terraform should work with"
}


# Resource Specific Variables

# Resource Group
variable "resource_grp_name" {
  type = string
}

# VMs
variable "vm_name" {
  type = string
}

variable "vm_count" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "vm_os_disk_caching" {
  type        = string
  description = "Size of the resource group"
}

variable "vm_os_disk_storage_acnt_type" {
  type        = string
  description = "Size of the resource group"
}

variable "vm_image_publisher" {
  type        = string
  description = "Size of the resource group"
}

variable "vm_username" {
  type        = string
  description = "Machine username"
}

variable "vm_public_key_path" {
  type        = string
  description = "ssh key path"
}

variable "vm_image_offer" {
  type        = string
  description = "Size of the resource group"
}

variable "vm_image_sku" {
  type        = string
  description = "Size of the resource group"
}

variable "vm_image_version" {
  type        = string
  description = "Size of the resource group"
}

# vnet
variable "vnet_name" {
  type = string
}

# subnets
variable "subnet_name" {
  type = string
}

# nic
variable "nic_name" {
  type = string
}

# Storage Account name
variable "storage_acnt_name" {
  type = string
}

# Storage Container name
variable "storage_container_name" {
  type = string
}


# # Pg Database
# variable "pg_server_name" {
#   type = string
# }

# variable "pg_sku_name" {
#   type = string
# }

# variable "pg_database_name" {
#   type = string
# }

# variable "pg_username" {
#   type = string
# }

# variable "pg_password" {
#   type = string
# }

# variable "pg_size" {
#   type = number
# }

# # variable "pg_server_version" {
# #   type = number
# # }

# variable "pg_retention_days" {
#   type = number
# }
