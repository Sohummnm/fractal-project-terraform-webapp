variable "name" {
  type        = string
  description = "Name of the App Service"
}

variable "location" {
  type        = string
  description = "Azure region for App Service"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group where App Service will be deployed"
}

variable "app_service_plan_id" {
  type        = string
  description = "ID of the App Service Plan"
}

variable "docker_image" {
  type        = string
  description = "Container image name (without tag)"
}

variable "docker_image_tag" {
  type        = string
  description = "Container image tag"
  default     = "latest"
}

variable "container_port" {
  type        = number
  description = "Port exposed by your container"
  default     = 80
}

# MySQL configuration
variable "mysql_host" {
  type        = string
  description = "MySQL hostname"
}

variable "mysql_username" {
  type        = string
  description = "MySQL username"
}

variable "mysql_password" {
  type        = string
  sensitive   = true
  description = "MySQL password"
}

variable "mysql_database" {
  type        = string
  description = "MySQL database name"
}

# Optional additional app settings
variable "additional_app_settings" {
  type        = map(string)
  default     = {}
  description = "Additional app settings for App Service"
}
variable "docker_registry_username" {
    description = "Enter Docker registry username"
}