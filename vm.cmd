cls
@echo off
terraform init
rem terraform plan -out=C:\LAB3\LAB3_Plan
terraform apply





































terraform state rm azurerm_network_interface.VMNIC-1
terraform state rm azurerm_public_ip.pubip
terraform state rm azurerm_virtual_machine.main
rem terraform state rm azurerm_resource_group.RG
rem terraform state rm azurerm_virtual_network.VNET-1
rem terraform state rm azurerm_virtual_network.VNET-2
rem terraform state rm azurerm_virtual_network.VNET-1
rem terraform state rm azurerm_virtual_network_peering.peer-a
rem terraform state rm azurerm_virtual_network_peering.peer-b

del terraform.tfstate.*.backup