###########################
# Terraform Configuration #
###########################

terraform {
  required_version = ">= 1.6.1"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.77"
    }
  }
}

################################
# Azure Provider Configuration #
################################

provider "azurerm" {
  // DO NOT HARDCODE CREDENTIALS (Use Environment Variables)
  features {}
}

################################################
# Example Terraform Azure Network Module Usage #
################################################

module "terraform_azure_network" {
  source = "../../"

  azure_region               = "East US"
  network_enable_ipv6        = false
  network_enable_nat         = false
  network_primary_cidr_block = "10.0.0.0/16"
  network_tags_name          = "example-complex"

  network_secondary_cidr_blocks = [
    "10.1.0.0/16",
    "10.2.0.0/16",
    "10.3.0.0/16",
    "10.4.0.0/16",
  ]

  subnets_private = [
    {
      cidr = "10.0.0.0/19",
      name = "private-1-a",
      zone = "a",
    },
    {
      cidr = "10.0.32.0/19",
      name = "private-1-b",
      zone = "b",
    },
    {
      cidr = "10.0.64.0/19",
      name = "private-1-c",
      zone = "c",
    },
    {
      cidr = "10.1.0.0/19",
      name = "private-2-a",
      zone = "a",
    },
    {
      cidr = "10.1.32.0/19",
      name = "private-2-b",
      zone = "b",
    },
    {
      cidr = "10.1.64.0/19",
      name = "private-2-c",
      zone = "c",
    },
    {
      cidr = "10.2.0.0/19",
      name = "private-3-a",
      zone = "a",
    },
    {
      cidr = "10.2.32.0/19",
      name = "private-3-b",
      zone = "b",
    },
    {
      cidr = "10.2.64.0/19",
      name = "private-3-c",
      zone = "c",
    },
    {
      cidr = "10.3.0.0/19",
      name = "private-4-a",
      zone = "a",
    },
    {
      cidr = "10.3.32.0/19",
      name = "private-4-b",
      zone = "b",
    },
    {
      cidr = "10.3.64.0/19",
      name = "private-4-c",
      zone = "c",
    },
    {
      cidr = "10.4.0.0/19",
      name = "private-5-a",
      zone = "a",
    },
    {
      cidr = "10.4.32.0/19",
      name = "private-5-b",
      zone = "b",
    },
    {
      cidr = "10.4.64.0/19",
      name = "private-5-c",
      zone = "c",
    },
  ]

  subnets_public = [
    {
      cidr = "10.0.192.0/20",
      name = "public-1-a",
      zone = "a",
    },
    {
      cidr = "10.0.208.0/20",
      name = "public-1-b",
      zone = "b",
    },
    {
      cidr = "10.0.224.0/20",
      name = "public-1-c",
      zone = "c",
    },
    {
      cidr = "10.1.192.0/20",
      name = "public-2-a",
      zone = "a",
    },
    {
      cidr = "10.1.208.0/20",
      name = "public-2-b",
      zone = "b",
    },
    {
      cidr = "10.1.224.0/20",
      name = "public-2-c",
      zone = "c",
    },
    {
      cidr = "10.2.192.0/20",
      name = "public-3-a",
      zone = "a",
    },
    {
      cidr = "10.2.208.0/20",
      name = "public-3-b",
      zone = "b",
    },
    {
      cidr = "10.2.224.0/20",
      name = "public-3-c",
      zone = "c",
    },
    {
      cidr = "10.3.192.0/20",
      name = "public-4-a",
      zone = "a",
    },
    {
      cidr = "10.3.208.0/20",
      name = "public-4-b",
      zone = "b",
    },
    {
      cidr = "10.3.224.0/20",
      name = "public-4-c",
      zone = "c",
    },
    {
      cidr = "10.4.192.0/20",
      name = "public-5-a",
      zone = "a",
    },
    {
      cidr = "10.4.208.0/20",
      name = "public-5-b",
      zone = "b",
    },
    {
      cidr = "10.4.224.0/20",
      name = "public-5-c",
      zone = "c",
    },
  ]
}
