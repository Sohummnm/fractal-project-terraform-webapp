terraform {
  required_version = ">=1.6.0, < 2.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "fractal-training-tfstate-acr"
    storage_account_name  = "fractalterraform"
    container_name        = "prod"
    key                   = "prod.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "1460ff46-1cc6-4ab3-846c-f4cd40286842"
  features {}
}
