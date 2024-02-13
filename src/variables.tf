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
  default     = "rgnetne01"
}

variable "admin_vnet_name" {
  type        = string
  description = "Admin network"
  default     = "kzk8svnetne01"
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