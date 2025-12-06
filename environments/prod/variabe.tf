# Resource Group
variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
}

# App Service Plan
variable "asp_sku" {
  type        = string
  description = "SKU for the App Service Plan"
}

# Web App / Container
variable "frontend_image" {
  type        = string
  description = "ACR image for frontend"
}

variable "container_port" {
  type        = number
  description = "Port the container exposes"
}

# Deployment Slots
variable "slot_names" {
  type        = list(string)
  description = "Names of deployment slots"
}

variable "acr_login_server" {
  type        = string
  description = "ACR login server URL"
}

variable "image_name" {
  type        = string
  description = "Container image name for slots"
}

# MySQL
variable "mysql_server_name" {
  type        = string
  description = "Name of the MySQL flexible server"
}

variable "mysql_admin_username" {
  type        = string
  description = "Admin username for MySQL"
}

variable "mysql_admin_password" {
  type        = string
  description = "Admin password for MySQL (leave empty to auto-generate)"
  sensitive   = true
}

variable "mysql_database_name" {
  type        = string
  description = "Name of the MySQL database"
}
variable "docker_registry_username" {
  type = string
  description = "Enter registry username"
}