# Resource Group
rg_name   = "fractal-terraform-project-rg"
rg_location  = "canadacentral"

# App Service Plan
asp_sku   = "S1"

# Web App / Container
docker_image = "sohummnm/frontend-blue"
docker_image_tag = "v1"      
container_port = 80

# Deployment Slots
slot_names = ["staging", "testing"]
docker_image_slot  = "sohummnm/frontend-green"
docker_image_tag_slot = "v1"
docker_registry_username = "sohummnm"


acr_login_server = "fractaltrainingterraform-g9csa7hef9gkhwau.azurecr.io" 
