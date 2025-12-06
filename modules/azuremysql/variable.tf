variable "mysql_name" {
  type        = string
  description = "Name of the MySQL flexible server."
}

variable "location" {
  type        = string
  description = "Azure region where the server will be created."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group where the server is deployed."
}

variable "admin_username" {
  type        = string
  description = "Admin username for MySQL."
}

variable "admin_password" {
  type        = string
  description = "Admin password for MySQL."
  sensitive   = true
}

variable "db_name" {
  type        = string
  description = "Database name to create."
}

variable "start_ip" {
  type        = string
  description = "Start IP for firewall rule."
}

variable "end_ip" {
  type        = string
  description = "End IP for firewall rule."
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied."
  default     = {}
}
