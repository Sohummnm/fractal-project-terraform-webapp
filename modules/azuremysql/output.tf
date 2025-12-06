output "mysql_server_name" {
  value = azurerm_mysql_server.this.name
}

output "mysql_fqdn" {
  value = azurerm_mysql_server.this.fqdn
}

output "mysql_admin_username" {
  value = azurerm_mysql_server.this.administrator_login
}

output "mysql_password" {
  value     = azurerm_mysql_server.this.administrator_login_password
  sensitive = true
}

output "database_name" {
  value = azurerm_mysql_database.db.name
}
