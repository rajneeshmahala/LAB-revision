variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "centralindia"
}

variable "vm_size" {
  description = "VM SKU to deploy. Change when a SKU has capacity restrictions."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "vm_zone" {
  description = "Optional availability zone (1, 2, or 3). Set null to omit."
  type        = string
  default     = null
  nullable    = true
}

resource "azurerm_resource_group" "my_vm_rg" {
  name     = "my-vm-rg"
  location = var.location
}

resource "azurerm_virtual_network" "my_vm_vnet" {
  name                = "my-vm-vnet"
  location            = azurerm_resource_group.my_vm_rg.location
  resource_group_name = azurerm_resource_group.my_vm_rg.name
  address_space       = ["172.16.0.0/16"]


}

resource "azurerm_subnet" "my_vm_subnet" {
  name                 = "my-vm-subnet"
  resource_group_name  = azurerm_resource_group.my_vm_rg.name
  virtual_network_name = azurerm_virtual_network.my_vm_vnet.name
  address_prefixes     = ["172.16.1.0/24"]


}

resource "azurerm_subnet" "my_vm_subnet_2" {
  name                 = "my-vm-subnet-2"
  resource_group_name  = azurerm_resource_group.my_vm_rg.name
  virtual_network_name = azurerm_virtual_network.my_vm_vnet.name
  address_prefixes     = ["172.16.2.0/24"]
  # public_network_access_enabled = false

}
resource "azurerm_subnet" "my_vm_subnet_3" {
  name                 = "my-vm-subnet-3"
  resource_group_name  = azurerm_resource_group.my_vm_rg.name
  virtual_network_name = azurerm_virtual_network.my_vm_vnet.name
  address_prefixes     = ["172.16.3.0/24"]
}

resource "azurerm_public_ip" "pip" {
  name                = "my-vm-pip"
  location            = azurerm_resource_group.my_vm_rg.location
  resource_group_name = azurerm_resource_group.my_vm_rg.name
  allocation_method   = "Static"

}

resource "azurerm_network_security_group" "nsg" {
  name                = "my-vm-nsg"
  location            = azurerm_resource_group.my_vm_rg.location
  resource_group_name = azurerm_resource_group.my_vm_rg.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  subnet_id                 = azurerm_subnet.my_vm_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id


}

resource "azurerm_network_interface" "nic" {
  name                = "my-vm-nic"
  location            = azurerm_resource_group.my_vm_rg.location
  resource_group_name = azurerm_resource_group.my_vm_rg.name
  ip_configuration {
    name                          = "my-vm-ip-config"
    subnet_id                     = azurerm_subnet.my_vm_subnet_3.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }

}

resource "azurerm_linux_virtual_machine" "my_vm" {
  name                  = "my-vm"
  location              = azurerm_resource_group.my_vm_rg.location
  resource_group_name   = azurerm_resource_group.my_vm_rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.vm_size
  zone                  = var.vm_zone
  admin_username        = "azureuser"
  admin_ssh_key {
    public_key = file(pathexpand("~/.ssh/id_rsa.pub"))
    username   = "azureuser"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }



}
