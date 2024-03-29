#####################################################
# AZURE PROVIDER CONFIGURATION
#####################################################


#####################################################
# GENERAL VARIABLES
#####################################################
variable "location" {
  description = "Azure region for resources. Default is West Europe"
  default     = "westeurope"
}

variable "net_security" {
  description = "Virtual Network Security Name"
  type        = string
  default     = "kzk8snsgne01"
}

variable "vnet_rg_name" {
  description = "Virtual Network RG name"
  type        = string
  default     = "rgnetne01"
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "kzk8svnetne01"
}
variable "vnet_address_space" {
  description = "VNet addres space. Default is 10.11.0.0/16"
  type        = list(string)
  default     = ["10.11.0.0/16"]
}

variable "cluster_sub_address" {
  description = "Cluster subnet"
  type        = string
  default     = "10.11.1.0/24"
}

variable "worker_sub_address" {
  description = "Worker subnet"
  type        = string
  default     = "10.11.2.0/24"
}

variable "cluster_sub_name" {
  description = "Cluster Subnet Name"
  type        = string
  default     = "kzclustersub"
}

variable "worker_sub_name" {
  description = "Worker Subnet Name"
  type        = string
  default     = "kzclworkersub"
}

variable "public_ip_name" {
  type        = string
  description = "Public IP name for the loadbalancer"
  default     = "kzpipne01"
}

variable "load_balancer_name" {
  type        = string
  description = "Load Balancer name"
  default     = "kzlbne01"
}

variable "admin_vnet_rg" {
  type        = string
  description = "Admin network resource group"
  default     = "rgmgtne01"
}

variable "admin_vnet_name" {
  type        = string
  description = "Admin network"
  default     = "vnetmgtne01"
}

variable "admin2workload" {
  type        = string
  description = "Peering from admin to workload"
  default     = "admintoworkload"
}

variable "workload2admin" {
  type        = string
  description = "Peering from workload to admin"
  default     = "workloadtoadmin"
}

#####################################################
# CLUSTER VARIABLES
#####################################################

variable "cluster_rg_name" {
  type        = string
  description = "Cluster resource group name"
  default     = "kzrgne01"
}

variable "cluster_prefix" {
  type        = string
  description = "Cluster instance prefix name"
  default     = "kzvmne01"
}

variable "cluster_count" {
  type        = number
  description = "Cluster instance number"
  default     = 3
}

variable "admin_user_name" {
  type        = string
  description = "admin username"
  default     = "efad5rcU"
}

variable "cluster_size" {
  type        = string
  description = "Cluster VM size"
  default     = "Standard_DS2_v2"
}

variable "vm_disk_caching" {
  type        = string
  description = "VM caching configuration"
  default     = "ReadWrite"
}

variable "storage_account_type" {
  type        = string
  description = "Virtual Machine storage account type"
  default     = "StandardSSD_LRS"
}

variable "vm_disk_size" {
  type        = number
  description = "VM disk size in GB"
  default     = 128
}

variable "vm_publisher" {
  type        = string
  description = "Publisher for the image"
  default     = "Canonical"
}

variable "vm_offer" {
  type        = string
  description = "VM offer"
  default     = "0001-com-ubuntu-server-jammy"
}

variable "vm_sku" {
  type        = string
  description = "Image sku"
  default     = "22_04-lts-gen2"
}

variable "cluster_availability_set" {
  type        = string
  description = "Availability set name"
  default     = "kzavsne01"
}

#####################################################
# CLUSTER VARIABLES
#####################################################

variable "worker_availability_set" {
  type        = string
  description = "Availability set name Worker"
  default     = "kzavsne02"
}

variable "worker_rg_name" {
  type        = string
  description = "Cluster resource group name"
  default     = "kzrgne02"
}

variable "worker_prefix" {
  type        = string
  description = "Cluster instance prefix name"
  default     = "kzvmne02"
}


variable "worker_count" {
  type        = number
  description = "Worker instance number"
  default     = 3
}

variable "worker_size" {
  type        = string
  description = "Cluster VM size"
  default     = "Standard_DS2_v2"
}