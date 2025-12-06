resource "azurerm_mysql_flexible_server" "this" {
  name                   = var.mysql_name
  location               = var.location
  resource_group_name    = var.resource_group_name

  administrator_login          = var.admin_username
  administrator_password        = var.admin_password

  sku_name   = "Standard_D2ds_v4"
  version    = "8.0"
  storage {
    size_gb = "16384"
  }

  backup_retention_days = 7

  high_availability {
    mode = "Disabled"
  }

  maintenance_window {
    day_of_week  = 0
    start_hour   = 0
    start_minute = 0
  }

  tags = var.tags
}

# -------------------------
# Create the database
# -------------------------
resource "azurerm_mysql_flexible_database" "db" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.this.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

# -------------------------
# Allow external access
# -------------------------
resource "azurerm_mysql_flexible_server_firewall_rule" "allow_my_ip" {
  name                = "allow-my-ip"
  start_ip_address    = var.start_ip
  end_ip_address      = var.end_ip
  resource_group_name = var.resource_group_name
  server_name = azurerm_mysql_flexible_server.this.name
  
}

output "mysql_fqdn" {
  value = azurerm_mysql_flexible_server.this.fqdn
}

output "database_name" {
  value = azurerm_mysql_flexible_database.db.name
}
