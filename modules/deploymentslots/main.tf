resource "azurerm_linux_web_app_slot" "this" {
  for_each          = toset(var.slot_names)
  app_service_id     = var.app_service_id
  name               = each.value
  https_only         = true

  site_config {
    application_stack {
      docker_image_name = "${var.docker_image_slot}:${var.docker_image_tag_slot}"
      docker_registry_url      = "https://index.docker.io"   # optional for Docker Hub
      docker_registry_username = var.docker_registry_username      # only if private
      docker_registry_password = var.docker_registry_password     # only if private
    }
  }

  app_settings = merge(
    {
      "WEBSITES_PORT"  = var.container_port
      "DB_HOST"     = var.mysql_host
      "DB_USER" = var.mysql_username
      "DB_PASSWORD" = var.mysql_password
      "DB_NAME" = var.mysql_database_name
    },
    var.additional_app_settings
  )

  identity {
    type = "SystemAssigned"
  }
}
