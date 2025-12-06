# Resource Group
rg_name   = "pe1-rg-dev"
rg_location  = "canadacentral"

# App Service Plan
asp_sku   = "S1"

# Web App / Container
docker_image        = "sohummnm/frontend"
docker_imagedocker_image_tag = "v3"      
container_port          = 80

# Deployment Slots
slot_names = ["staging", "testing"]
docker_image_slot  = "sohummnm/frontend"
docker_image_tag_slot = "v2"
docker_registry_username = "sohummnm"


acr_login_server = "fractaltrainingterraform-g9csa7hef9gkhwau.azurecr.io" 