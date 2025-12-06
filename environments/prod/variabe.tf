# Resource Group
variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}

variable "rg_location" {
  type        = string
  description = "Azure region to deploy resources"
}

# App Service Plan
variable "asp_sku" {
  type        = string
  description = "SKU for the App Service Plan"
}

# Web App / Container


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

variable "docker_image" {
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
variable "docker_image_tag" {
  description = "Enter Docker Image tag"
}
variable "docker_registry_password" {
  description = "Enter Docker registry password"
}
variable "docker_image_slot" {
  description = "Enter Docker image slot"
}
variable "docker_image_tag_slot" {
  description = "Enter Docker image tag slot"
}