resource "random_password" "mysql_password" {
  length  = 16
  special = true
}

resource "azurerm_mysql_flexible_server" "this" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  version             = var.mysql_version
  sku_name            = var.sku_name
  administrator_login = var.admin_username
  administrator_password = var.admin_password != "" ? var.admin_password : random_password.mysql_password.result
}

# Optional firewall rule to allow App Service / local access
resource "azurerm_mysql_flexible_server_firewall_rule" "allow_app_service" {
  count               = var.public_access_enabled ? 1 : 0
  name                = "allow-app-service"
  resource_group_name = azurerm_mysql_flexible_server.this.resource_group_name
  server_name         = azurerm_mysql_flexible_server.this.name
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}

resource "azurerm_mysql_flexible_server_database" "db" {
  name                = var.database_name
  resource_group_name = azurerm_mysql_flexible_server.this.resource_group_name
  server_name         = azurerm_mysql_flexible_server.this.name
  charset             = var.charset
  collation           = var.collation
}
