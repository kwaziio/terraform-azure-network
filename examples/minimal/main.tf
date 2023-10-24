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

module "terraform_aws_network" {
  source = "../../"

  azure_region               = "East US"
  network_primary_cidr_block = "10.0.0.0/16"
  network_tags_name          = "example-minimal"

  subnets_private = [
    {
      cidr = "10.0.0.0/19",
      name = "private-a",
      zone = "a",
    },
    {
      cidr = "10.0.32.0/19",
      name = "private-b",
      zone = "b",
    },
    {
      cidr = "10.0.64.0/19",
      name = "private-c",
      zone = "c",
    },
  ]

  subnets_public = [
    {
      cidr = "10.0.192.0/20",
      name = "public-a",
      zone = "a",
    },
    {
      cidr = "10.0.208.0/20",
      name = "public-b",
      zone = "b",
    },
    {
      cidr = "10.0.224.0/20",
      name = "public-c",
      zone = "c",
    },
  ]
}
