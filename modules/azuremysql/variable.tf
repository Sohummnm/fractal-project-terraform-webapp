variable "server_name" {
  type        = string
  description = "Name of the MySQL server"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "admin_username" {
  type        = string
  default     = "mysqladmin"
}

variable "admin_password" {
  type        = string
  default     = ""
  sensitive   = true
}

variable "mysql_version" {
  type    = string
  default = "5.7"
}

# SKU + Performance
variable "sku_name" {
  type    = string
  default = "B_Gen5_1"
}

variable "tier" {
  type    = string
  default = "Basic"
}

variable "family" {
  type    = string
  default = "Gen5"
}

variable "capacity" {
  type    = number
  default = 1
}

# Storage
variable "storage_mb" {
  type    = number
  default = 5120
}

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "geo_redundant_backup" {
  type    = string
  default = "Disabled"
}

variable "ssl_enforcement" {
  type    = string
  default = "Enabled"
}

# Database
variable "database_name" {
  type = string
}

variable "charset" {
  type    = string
  default = "utf8"
}

variable "collation" {
  type    = string
  default = "utf8_general_ci"
}

# Firewall rule
variable "enable_firewall_rule" {
  type    = bool
  default = false
}

variable "start_ip" {
  type    = string
  default = "0.0.0.0"
}

variable "end_ip" {
  type    = string
  default = "255.255.255.255"
}
