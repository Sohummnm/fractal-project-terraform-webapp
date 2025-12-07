variable "slot_names" {
  type        = list(string)
  description = "Names of the deployment slots (example: ['staging', 'blue'])"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "app_service_name" {
  type        = string
  description = "Name of the parent App Service"
}

variable "docker_image_slot" {
  type        = string
  description = "Container image name"
}

variable "docker_image_tag_slot" {
  type        = string
  description = "Container image tag"
  default     = "latest"
}

variable "container_port" {
  type        = number
  description = "Container port"
  default     = 80
}

# MySQL config
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

variable "mysql_database_name" {
  type        = string
  description = "MySQL database name"
}

variable "additional_app_settings" {
  type        = map(string)
  default     = {}
  description = "Extra app settings for slot"
}
variable "app_service_id" {
  description = "Enter app service id"
}
variable "image_name" {
  description = "Enter docker image name with tag"
}
variable "acr_login_server" {
  description = "Enter ACR login server"
}
variable "docker_registry_username" {
    description = "Enter Docker registry username"
}
variable "docker_registry_password" {
  description = "Enter Docker registry password"
}
