variable "name" {
  type        = string
  description = "Name of the App Service Plan"
}

variable "location" {
  type        = string
  description = "Azure region where ASP should be deployed"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "sku_name" {
  type        = string
  description = "App Service Plan SKU (e.g., B1, P1v3, S1)"
  default     = "S1"
}
