resource "azurerm_resource_group" "tfvnetr" {
  name     = "tfvaaaaanetr"
  location = "eastus"
}

resource "azurerm_virtual_network" "tfvnet" {
  name                = "tfvaaaaanet"
  location            = azurerm_resource_group.tfvnetr.location
  resource_group_name = azurerm_resource_group.tfvnetr.name
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_virtual_network" "tfvnet1" {
  name                = "tfvaaaaan1et"
  location            = azurerm_resource_group.tfvnetr.location
  resource_group_name = azurerm_resource_group.tfvnetr.name
  address_space       = ["192.169.0.0/16"]
}

resource "azurerm_virtual_network" "tfvnet2" {
  name                = "tfvaaaaan2et"
  location            = azurerm_resource_group.tfvnetr.location
  resource_group_name = azurerm_resource_group.tfvnetr.name
  address_space       = ["192.166.0.0/24"]
}