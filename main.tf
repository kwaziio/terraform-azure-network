################################################
# Cretes Azure Resource Group for this Network #
################################################

resource "azurerm_resource_group" "main" {
  location = var.azure_region
  name     = "network-${var.network_tags_name}"
}

#################################
# Creates Azure Virtual Network #
#################################

resource "azurerm_virtual_network" "main" {
  address_space       = concat([var.network_primary_cidr_block], var.network_secondary_cidr_blocks)
  location            = azurerm_resource_group.main.location
  name                = var.network_tags_name
  resource_group_name = azurerm_resource_group.main.name
}
