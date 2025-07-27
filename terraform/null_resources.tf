resource "null_resource" "k8s_ansible_config" {
  triggers = { 
    cluster_id = azurerm_kubernetes_cluster.aks-prod-cluster.id 
  }
  
  provisioner "local-exec" {
    command = <<EOT
  az aks get-credentials \
        --resource-group ${azurerm_resource_group.rg-prod.name} \
        --name ${azurerm_kubernetes_cluster.aks-prod-cluster.name} \
        --file "${path.module}/../../ansible/roles/deploy2-k8s/files/aks-kubeconf.yaml" \
        --overwrite-existing
  EOT
    }
} 

resource "null_resource" "terraform_ansible_bridge" {
  triggers =  {
    ansible_master_id = azurerm_linux_virtual_machine.ansible-prod-node1.id
  }

  provisioner "local-exec" {
    command = <<EOT
terraform output -raw private_key_pem > ~/.ssh/prod_ansible_vm_key && \
chmod 600 ~/.ssh/prod_ansible_vm_key && \
ssh-add ~/.ssh/prod_ansible_vm_key && \
terraform output -json > outputs.json
EOT
    }
}