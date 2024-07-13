variable "vm_count" {
  type = string
}
variable "resource_grp_name" {
  type = string
}

variable "env" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "location" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "public_ip_name" {
  type        = string
  description = "ssh key path"
}

variable "public_ip_id" {
  type        = list(string)
  description = "public ip id"
}

variable "vm_name" {
  type        = string
  description = "Name of the resource group"
}

variable "prefix" {
  type        = string
  default     = "swarm-vm"
  description = "Prefix of the resource name"
}