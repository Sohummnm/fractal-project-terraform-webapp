output "host" {
  value = azurerm_mysql_flexible_server.this.fqdn
}

output "username" {
  value = azurerm_mysql_flexible_server.this.administrator_login
}

output "password" {
  value = azurerm_mysql_flexible_server.this.administrator_login_password
  sensitive = true
}

output "database_name" {
  value = azurerm_mysql_flexible_server_database.db.name
}
