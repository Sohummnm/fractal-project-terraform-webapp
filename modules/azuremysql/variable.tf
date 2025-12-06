variable "server_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "mysql_version" {
  type    = string
  default = "8.0"
}

variable "sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "storage_mb" {
  type    = number
  default = 32768
}

variable "admin_username" {
  type    = string
  default = "mysqladmin"
}

variable "admin_password" {
  type    = string
  default = "" # auto-generated if empty
}

variable "public_access_enabled" {
  type    = bool
  default = false
}

variable "start_ip_address" {
  type    = string
  default = "0.0.0.0"
}

variable "end_ip_address" {
  type    = string
  default = "0.0.0.0"
}

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "auto_grow_enabled" {
  type    = bool
  default = true
}

variable "high_availability_mode" {
  type    = string
  default = "Disabled"
}

variable "database_name" {
  type    = string
  default = "appdb"
}

variable "charset" {
  type    = string
  default = "utf8"
}

variable "collation" {
  type    = string
  default = "utf8_general_ci"
}
