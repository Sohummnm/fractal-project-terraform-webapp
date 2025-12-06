resource "random_password" "mysql_password" {
  length  = 16
  special = true
}

resource "azurerm_mysql_server" "this" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password != "" ? var.admin_password : random_password.mysql_password.result

  version = var.mysql_version

  sku {
    name     = var.sku_name      # e.g. B_Gen5_1
    tier     = var.tier          # e.g. Basic
    family   = var.family        # e.g. Gen5
    capacity = var.capacity      # e.g. 1
  }

  storage_profile {
    storage_mb            = var.storage_mb
    backup_retention_days = var.backup_retention_days
    geo_redundant_backup  = var.geo_redundant_backup
  }

  ssl_enforcement = var.ssl_enforcement
}

resource "azurerm_mysql_database" "db" {
  name                = var.database_name
  resource_group_name = azurerm_mysql_server.this.resource_group_name
  server_name         = azurerm_mysql_server.this.name
  charset             = var.charset
  collation           = var.collation
}

resource "azurerm_mysql_firewall_rule" "allow_access" {
  count               = var.enable_firewall_rule ? 1 : 0
  name                = "allow-access"
  resource_group_name = azurerm_mysql_server.this.resource_group_name
  server_name         = azurerm_mysql_server.this.name
  start_ip_address    = var.start_ip
  end_ip_address      = var.end_ip
}