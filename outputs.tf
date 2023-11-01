#####################################################################
# Provides Information for Network Resources Created by this Module #
#####################################################################

output "network_cidrs" {
  description = "List of CIDR Blocks Associated w/ this Network"
  value       = local.network_cidrs
}

output "network_id" {
  description = "Dynamically-Assigned Identifier (ID) for this Network"
  value       = azurerm_virtual_network.main.id
}

output "network_name" {
  description = "Name Assigned to this Network During Creation"
  value       = azurerm_virtual_network.main.name
}

#####################################################################
# Provides Information for Routing Resources Created by this Module #
#####################################################################

output "routers_private" {
  description = "List of Objects Representing Private Router Attributes"

  value = [for router in azurerm_route_table.private : {
    name = router.name
  }]
}

output "routers_public" {
  description = "List of Objects Representing Public Router Attributes"

  value = [for router in azurerm_route_table.public : {
    name = router.name
  }]
}

####################################################################
# Provides Information for Subnet Resources Created by this Module #
####################################################################

output "subnets_private" {
  description = "List of Objects Representing Private Subnet Attributes"

  value = [for subnet in azurerm_subnet.private : {
    cidr_block = one(subnet.address_prefixes)
    id         = subnet.id
    name       = subnet.name
  }]
}

output "subnets_public" {
  description = "List of Objects Representing Public Subnet Attributes"

  value = [for subnet in azurerm_subnet.public : {
    cidr_block = one(subnet.address_prefixes)
    id         = subnet.id
    name       = subnet.name
  }]
}
