resource "azurerm_kubernetes_cluster" "aks-prod-cluster" {
    name = "terraform-aks-unir-prod"
    location = azurerm_resource_group.rg-prod.location
    resource_group_name = azurerm_resource_group.rg-prod.name
    dns_prefix = "terraformaksunir-prod"
    default_node_pool {
        name = "default"
        node_count = 1
        vm_size = "Standard_B2s"
        enable_auto_scaling = true
        min_count = 1
        max_count = 3
    }
    identity {
        type = "SystemAssigned"
    }
    tags = {
        environment = "casopractico2"
        owner = "Hector Martinez"
    }
}

