resource "azurerm_linux_virtual_machine" "ansible-prod-node1" {
    name = "ansible-node1"
    resource_group_name = azurerm_resource_group.rg-prod.name
    location = azurerm_resource_group.rg-prod.location
    size = "Standard_B1s"
    admin_username = "azureuser"
    network_interface_ids = [azurerm_network_interface.k8s-prod-nic1.id]
    
    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        name                 = "ansible-osdisk"
    }
    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-focal"
        sku       = "20_04-lts"
        version   = "latest"
    }
    admin_ssh_key {
        username = "azureuser"
        #public_key = file("~/.ssh/id_rsa.pub")
        public_key = azurerm_ssh_public_key.ssh_key-prod-ansible-vm.public_key
    }

    tags = {
        environment = "casopractico2"
        owner = "Hector Martinez"
    }
}