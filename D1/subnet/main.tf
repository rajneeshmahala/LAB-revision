resource "azurerm_resource_group"   "vnetsubnrt" {
    name     = "vnetsubnetrg"
    location = "centralindia"
  
}
resource "azurerm_virtual_network" "vnet" {
    name="vnetsubnetvnetvnet"
    location=azurerm_resource_group.vnetsubnrt.location
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    address_space=["172.16.0.0/16"]

}
resource "azurerm_subnet" "subnet" {
    name="subnetvm"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.1.0/24"]

}
resource "azurerm_subnet" "subnett" {
    name="subnetvm1"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.2.0/24"]
}

resource "azurerm_subnet" "subnettt" {
    name="subnetvm2"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.3.0/24"]
}
resource "azurerm_subnet" "subnetttt" {
    name="subnetvm3"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.4.0/24"]

}

resource "azurerm_subnet" "subnetee" {
    name="subnetvm4"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.5.0/24"]
    }
resource "azurerm_subnet" "subnetwe" {
    name="subnetvm5"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.6.0/24"]
}
resource "azurerm_subnet" "subnetwer" {
    name="subnetvm6"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.7.0/24"]
}
resource "azurerm_subnet" "subnetsf" {
    name="subnetvm7"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.8.0/24"]  
}   
resource "azurerm_subnet" "subnetgd" {
    name="subnetvm8"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.9.0/24"]
}
resource "azurerm_subnet" "subnetdfe" {
    name="subnetvm9"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.10.0/24"]
}   
resource "azurerm_subnet" "subnethr" {
    name="subnetvm10"
    resource_group_name=azurerm_resource_group.vnetsubnrt.name
    virtual_network_name=azurerm_virtual_network.vnet.name
    address_prefixes=["172.16.11.0/26"] 
  
}