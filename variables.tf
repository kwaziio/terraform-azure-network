###################################
# Azure Environment Configuration #
###################################

variable "azure_region" {
  description = "Name of the Azure Region Where the Network Will be Creted"
  type        = string
}

#######################################
# Azure Virtual Network Configuration #
#######################################

variable "network_enable_ipv6" {
  default     = true
  description = "'true' if IPv6 Support Should be Enabled for the Created Network"
  type        = bool
}

variable "network_enable_nat" {
  default     = true
  description = "'true' if Network Address Translation (NAT) Gateways Should be Created"
  type        = bool
}

variable "network_primary_cidr_block" {
  description = "Primary IPv4 CIDR Block to Associate w/ the Created Network"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.network_primary_cidr_block))
    error_message = "Value Must be in Valid IPv4 CIDR Notation (RFC 4632 3.1)"
  }
}

variable "network_secondary_cidr_blocks" {
  default     = []
  description = "List of Secondary IPv4 CIDR Blocks to Associate w/ the Created Network"
  type        = list(string)
}

variable "network_service_endpoints" {
  description = "List of Azure Service Endpoints to Enable for Each Subnet"
  type        = list(string)

  default = [
    "Microsoft.AzureActiveDirectory",
    "Microsoft.AzureCosmosDB",
    "Microsoft.EventHub",
    "Microsoft.KeyVault",
    "Microsoft.ServiceBus",
    "Microsoft.Sql",
    "Microsoft.Storage",
    "Microsoft.Web",
  ]
}

variable "network_tags_name" {
  description = "Name to Associate w/ the Created Network"
  type        = string
}

##############################################
# Azure Virtual Network Subnet Configuration #
##############################################

variable "subnets_private" {
  default     = []
  description = "List of Private Subnets w/ Assigned Name and IPv4 CIDR Values"

  type = list(object({
    cidr = string
    name = string
    zone = string
  }))
}

variable "subnets_public" {
  default     = []
  description = "List of Public Subnets w/ Assigned Name and IPv4 CIDR Values"

  type = list(object({
    cidr = string
    name = string
    zone = string
  }))
}
