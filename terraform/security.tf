resource "tls_private_key" "ssh_key-prod-ansible-vm" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "azurerm_ssh_public_key" "ssh_key-prod-ansible-vm" {
    name                = "ssh-key-prod-ansible-vm"
    location = azurerm_resource_group.rg-prod.location
    resource_group_name = azurerm_resource_group.rg-prod.name
    public_key = tls_private_key.ssh_key-prod-ansible-vm.public_key_openssh

    tags = {
        environment = "casopractico2"
        owner = "Hector Martinez"
    }
}