output "kubernetes_cluster_info" {
  value = <<EOF
    K8s cluster name: ${azurerm_kubernetes_cluster.aks-prod-cluster.name},
    K8s cluster FQDN: ${azurerm_kubernetes_cluster.aks-prod-cluster.fqdn}

  EOF
  description = "Information about the Kubernetes cluster."
}

output "ACR_info" {
  value = {
    name            = azurerm_container_registry.k8s-prod-acr.name
    username        = azurerm_container_registry.k8s-prod-acr.admin_username
    admin_password  = azurerm_container_registry.k8s-prod-acr.admin_password
    location        = azurerm_container_registry.k8s-prod-acr.location
    sku             = azurerm_container_registry.k8s-prod-acr.sku
  }
  sensitive = true
  description = "Information about the Azure Container Registry."
}

output "ACR_nameonly" {
  value = azurerm_container_registry.k8s-prod-acr.name
}

output "vm_info" {
  value = <<EOF
    VM Name: ${azurerm_linux_virtual_machine.ansible-prod-node1.name},
    VM Size: ${azurerm_linux_virtual_machine.ansible-prod-node1.size},
    VM Location: ${azurerm_linux_virtual_machine.ansible-prod-node1.location},
    VM Resource Group: ${azurerm_linux_virtual_machine.ansible-prod-node1.resource_group_name}
  EOF
  description = "Information about the Virtual Machine."
}

output "vm_ansible_name" {
  value = azurerm_linux_virtual_machine.ansible-prod-node1.name  
}

output "vm_ansible_ips" {
  value = azurerm_linux_virtual_machine.ansible-prod-node1.public_ip_address
}

output "network_info" {
  value = <<EOF
    Virtual Network Name: ${azurerm_virtual_network.k8s-prod-net.name},
    Virtual Network Address Space: ${azurerm_virtual_network.k8s-prod-net.address_space[0]},
    Subnet Name: ${azurerm_subnet.k8s-prod-subnet1.name},
    Subnet Address Prefix: ${azurerm_subnet.k8s-prod-subnet1.address_prefixes[0]}
  EOF
  description = "Information about the Virtual Network and Subnets."
}

output "public_ip" {
  value = azurerm_public_ip.k8s-prod-pip1.ip_address
  description = "Public IP address for the Kubernetes cluster."
}

output "security_group" {
  value = <<EOF
    Security Group ID: ${azurerm_network_security_group.nsg-prod.id}
    Security Group Name: ${azurerm_network_security_group.nsg-prod.name}
  EOF
  description = "Network Security Group ID and Name."
}

output "nsg_association" {
  value = "Network Security Group ${azurerm_network_security_group.nsg-prod.name} is associated with the subnet: ${azurerm_subnet.k8s-prod-subnet1.name} and NIC: ${azurerm_network_interface.k8s-prod-nic1.name}"
  description = "Association of the Network Security Group with the subnet."
}
output "security_rules" {
  value = "Security rules created: ${join(" | ", [for rule in azurerm_network_security_group.nsg-prod.security_rule : rule.name])}"
  description = "List of security rules in the Network Security Group."
}

output "private_key_pem" {
  value     = tls_private_key.ssh_key-prod-ansible-vm.private_key_pem
  # Note: This output is sensitive and should be handled with care.
  sensitive = true
  description = "Private key in PEM format for the VM."
}
