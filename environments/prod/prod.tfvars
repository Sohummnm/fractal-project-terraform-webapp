# Resource Group
rg_name   = "pe1-rg-dev"
rg_location  = "canadacentral"

# App Service Plan
asp_sku   = "S1"

# Web App / Container
image_name        = "frontend:v2"      # This should match variable name
container_port          = 80

# Deployment Slots
slot_names              = ["staging", "testing"]
slot_docker_image       = "frontend:v3"
docker_registry_username = "sohummnm"

acr_login_server = "fractaltrainingterraform-g9csa7hef9gkhwau.azurecr.io"