resource "azurerm_network_security_group" "nsg-prod" {
    name                = "nsg-prod"
    location            = azurerm_resource_group.rg-prod.location
    resource_group_name = azurerm_resource_group.rg-prod.name

    security_rule {
        name                       = "AllowSSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "AllowHTTP"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "AllowHTTP8080"
        priority                   = 120
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "AllowHTTPS"
        priority                   = 130
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "casopractico2"
        owner = "Hector Martinez"
    }
}

# NSG (Network Security Group) Subnet association
resource "azurerm_subnet_network_security_group_association" "k8s-prod-subnet-nsg-association" {
    subnet_id                 = azurerm_subnet.k8s-prod-subnet1.id
    network_security_group_id = azurerm_network_security_group.nsg-prod.id
}

# NSG (Network Security Group) NIC association
resource "azurerm_network_interface_security_group_association" "k8s-prod-nic-nsg-association" {
    network_interface_id      = azurerm_network_interface.k8s-prod-nic1.id
    network_security_group_id = azurerm_network_security_group.nsg-prod.id
}