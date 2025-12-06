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

variable "docker_registry_username" {
  type = string
  description = "Enter registry username"
}
variable "slot_docker_image" {
  description = "Enter slots docker image name"
}
variable "mysql_host" {
  description = "Enter sql host"
}
variable "mysql_username" {
  description = "Enter sql username"
}
variable "mysql_database_name" {
  description = "value"
}
variable "mysql_password" {
  description = "Enter password"
}