resource "azurerm_container_registry" "k8s-prod-acr" {
    name = "terraformacrunir"
    resource_group_name = azurerm_resource_group.rg-prod.name
    location = azurerm_resource_group.rg-prod.location
    sku = "Basic"
    admin_enabled = true

    tags = {
      environment = "casopractico2"
      owner = "Hector Martinez"
    }
}

resource "azurerm_role_assignment" "k8s-prod-acr-pull" {
    scope                = azurerm_container_registry.k8s-prod-acr.id
    role_definition_name = "AcrPull"
    principal_id         = azurerm_kubernetes_cluster.aks-prod-cluster.kubelet_identity[0].object_id

    depends_on = [ azurerm_container_registry.k8s-prod-acr ]
}

resource "azurerm_user_assigned_identity" "k8s-prod-acr-identity" {
    name = "k8s-prod-acr-identity"
    resource_group_name = azurerm_resource_group.rg-prod.name
    location = azurerm_resource_group.rg-prod.location

    depends_on = [ azurerm_container_registry.k8s-prod-acr ]

    tags = {
      environment = "casopractico2"
      owner = "Hector Martinez"
    }
}