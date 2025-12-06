# Resource Group
output "resource_group_name" {
  value       = module.rg.name
  description = "Resource Group name"
}

output "resource_group_location" {
  value       = module.rg.location
  description = "Resource Group location"
}

# App Service Plan
output "app_service_plan_id" {
  value       = module.app_service_plan.id
  description = "App Service Plan ID"
}

# Web App
output "appservice_name" {
  value       = module.appservice
  description = "App Service name"
}

output "webapp_default_hostname" {
  value       = module.appservice.default_hostname
  description = "Web App default hostname"
}

# Deployment Slots
output "slot_names" {
  value       = module.webapp_slots.slot_names
  description = "Deployment slots names"
}

