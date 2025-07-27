resource "local_file" "ansible_dyn_inventory" {
    content = templatefile("inventory.tmpl", {
        vm_ansible_name = azurerm_linux_virtual_machine.ansible-prod-node1.name
        vm_ansible_ips = azurerm_linux_virtual_machine.ansible-prod-node1.public_ip_address
    })
    filename = "${path.module}/../../ansible/inventory.yaml"
}