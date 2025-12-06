resource "azurerm_linux_web_app" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id

  https_only = true

  site_config {
    always_on = true

    application_stack {
      docker_registry_username = var.docker_registry_username
      docker_image_name = var.docker_image
    }
  }

  # App Settings for environment variables & MySQL connection
  app_settings = merge(
    {
      "WEBSITES_PORT"              = var.container_port
      "MYSQL_HOST"                 = var.mysql_host
      "MYSQL_USERNAME"             = var.mysql_username
      "MYSQL_PASSWORD"             = var.mysql_password
      "MYSQL_DATABASE"             = var.mysql_database
    },
    var.additional_app_settings
  )

  identity {
    type = "SystemAssigned"
  }
}

