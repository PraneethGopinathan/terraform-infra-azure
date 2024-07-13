resource "azurerm_resource_group" "resource_grp" {
  name     = var.grp_name
  location = var.location

  tags = {
    Environment = var.env
  }
}