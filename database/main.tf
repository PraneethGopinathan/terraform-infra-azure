resource "azurerm_postgresql_server" "pg_server" {
  name                = var.pg_server_name
  location            = var.location
  resource_group_name = var.resource_grp_name

  sku_name = var.pg_sku_name

  storage_mb                   = var.size
  backup_retention_days        = var.retention_days
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.username
  administrator_login_password = var.password
  version                      = 11
  ssl_enforcement_enabled      = true

  tags = {
    env = var.env
  }
}

resource "azurerm_postgresql_database" "pg_database" {
  name                = var.pg_database_name
  resource_group_name = var.resource_grp_name
  server_name         = var.pg_server_name
  charset             = "UTF8"
  collation           = "English_United States.1252"
  depends_on          = [azurerm_postgresql_server.pg_server]
}
