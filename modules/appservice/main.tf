resource "azurerm_linux_web_app" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id

  https_only = true

  site_config {
    application_stack {
      docker_image_name = "${var.docker_image}:${var.docker_image_tag}"
      docker_registry_url      = "https://index.docker.io"   # optional for Docker Hub
      docker_registry_username = var.docker_registry_username      # only if private
      docker_registry_password = var.docker_registry_password     # only if private
    }
  }


  # App Settings for environment variables & MySQL connection
  app_settings = merge(
    {
      "WEBSITES_PORT"              = var.container_port
      "DB_HOST"                 = var.mysql_host
      "DB_USER"             = var.mysql_username
      "DB_PASSWORD"             = var.mysql_password
      "DB_NAME"             = var.mysql_database_name
    },
    var.additional_app_settings
  )

  identity {
    type = "SystemAssigned"
  }
}

