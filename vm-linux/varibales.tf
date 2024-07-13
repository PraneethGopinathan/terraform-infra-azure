variable "location" {
  type        = string
  description = "Name of the location"
}

variable "vm_count" {
  type        = string
  description = "Name of the location"
}

variable "vm_name" {
  type        = string
  description = "Name of the resource group"
}

variable "vm_size" {
  type        = string
  description = "Size of the resource group"
}

variable "vm_os_disk_caching" {
  type        = string
  description = "Disk OS caching"
}

variable "vm_os_disk_storage_acnt_type" {
  type        = string
  description = "Disk OS storage account type"
}

variable "vm_image_publisher" {
  type        = string
  description = "Image Publisher"
}

variable "vm_image_offer" {
  type        = string
  description = "Image Offer"
}

variable "vm_username" {
  type        = string
  description = "Machine username"
}

variable "vm_public_key_path" {
  type        = string
  description = "ssh key path"
}

variable "vm_image_sku" {
  type        = string
  description = "Image SKU"
}

variable "vm_image_version" {
  type        = string
  description = "Image Version"
}

variable "env" {
  type = string
}

variable "resource_grp_name" {
  type = string
}

variable "nic_id" {
  type = list(string)
}
