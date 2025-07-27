# Terraform configuration for Azure Virtual Network and Subnets
# Variables
/*
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location for resources"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "myVnet"
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name           = string
    address_prefix = string
  }))
  default = [
    {
      name           = "subnet1"
      address_prefix = "10.0.1.0/24"
    },
    {
      name           = "subnet2"
      address_prefix = "10.0.2.0/24"
    }
  ]
}

variable "nic_name" {
  description = "The name of the network interface"
  type        = string
  default     = "myNic"
}
*/