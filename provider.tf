# Main Terraform

provider "azurerm" {
  features {}
}

terraform {

  required_providers {

    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_resource_group" "azurepoc" {
  name     = var.resgroup
  location = "northeurope"
}
