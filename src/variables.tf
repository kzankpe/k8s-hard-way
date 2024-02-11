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