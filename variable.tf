variable "rgname" {default="LAB3-RG1"}
variable "location" {default = "eastus"}
variable "vmname" {  
    validation {
    condition     = length(var.vmname) > 5 && substr(var.vmname, 0, 5) == "VM-1-"
    error_message = "The RG value must be a valid name, starting with \"VM-1-\"."
  }
  }
variable "vnet1" {default ="VNETEast1"}
variable "subnetfront-name-vnet1" {default ="SubnetFrontEnd"}
variable "subnetback-name-vnet1" {default ="SubnetBackEnd"}
variable "addressspace-vnet1" { default = ["172.16.0.0/16"]}
variable "subnetfront-addr-vnet1" { default = "172.16.1.0/24"}
variable "subnetback-addr-vnet1" { default = ["172.16.2.0/24"]}
# variable "nicname" {
#   default=var.vmname
# }



# variable "vnet2" {default ="VNETEast2"}
# variable "subnetfront-name-vnet2" {default ="SubnetFrontEnd"}
# variable "subnetback-name-vnet2" {default ="SubnetBackEnd"}
# variable "addressspace-vnet2" { default = ["172.18.0.0/16"]}
# variable "subnetfront-addr-vnet2" { default = "172.18.1.0/24"}
# variable "subnetback-addr-vnet2" { default = "172.18.2.0/24"}
# variable "peer1" {default ="VNET1_TO_VNET2"}
# variable "peer2" {default ="VNET2_TO_VNET1"}

