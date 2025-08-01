terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~>3.0"
        }
    }
}
provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg-prod" {
    name = "rg-terraform-prod"
    location = "West Europe"

    tags = {
        environment = "casopractico2"
        owner = "Hector Martinez"
    }
}