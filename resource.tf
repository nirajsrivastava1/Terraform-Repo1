resource "azurerm_resource_group" "RG" {
    name=var.rgname
    location=var.location
}
resource "azurerm_virtual_network" "VNET-1" {
        name = var.vnet1
        resource_group_name = azurerm_resource_group.RG.name
        location=var.location
        address_space = var.addressspace-vnet1

    
}

resource "azurerm_subnet" "SUBNET-BACK" {
    name=var.subnetback-name-vnet1
    resource_group_name = azurerm_resource_group.RG.name
    virtual_network_name = azurerm_virtual_network.VNET-1.name
    address_prefixes = var.subnetback-addr-vnet1
  
}

resource "azurerm_network_interface" "VMNIC-1" {
  name                = var.vmname
  location            = var.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = var.vmname
    subnet_id                     = azurerm_subnet.SUBNET-BACK.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pubip.id
  }
}
resource "azurerm_public_ip" "pubip" {
  allocation_method = "Dynamic"
  location = var.location
  name = var.vmname
  resource_group_name = azurerm_resource_group.RG.name

}

resource "azurerm_virtual_machine" "main" {
  name                  = var.vmname
  location              = azurerm_resource_group.RG.location
  resource_group_name   = azurerm_resource_group.RG.name
  network_interface_ids = [azurerm_network_interface.VMNIC-1.id]
  vm_size               = "Standard_D2s_v3"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2012-R2-Datacenter"
    version   = "latest"
  }
  storage_os_disk {
    name              = var.vmname
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.vmname
    admin_username = "Niraj"
    admin_password = "Admin@123456"
  }
  os_profile_windows_config {
    provision_vm_agent = true
    
  }
}

# resource "azurerm_virtual_machine_extension" "myextension" {
#   name                 = "iis_install"
#   virtual_machine_id   = azurerm_virtual_machine.main.id
#   publisher            = "Microsoft.Azure.Extensions"
#   type                 = "CustomScript"
#   type_handler_version = "2.0"

#   settings = <<SETTINGS
#     {
#         "commandToExecute": "powershell -ExecutionPolicy Unrestricted add-windowsfeature web-server -includeallsubfeature"
#     }
# SETTINGS


#   tags = {
#     environment = "Production"
#   }
# }

