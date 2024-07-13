resource "azurerm_storage_account" "storage_acnt" {
  name                     = var.storage_acnt_name
  resource_group_name      = var.resource_grp_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    Environment = var.env
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_acnt_name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storage_acnt]
}
