# Terraform Azure Network Module by KWAZI

Terraform Module for Creating a Configurable Network Stack on Microsoft Azure

## Getting Started

> NOTE: This section assumes that you have Terraform experience, have already created an Azure account, and have already configured programmatic access to that account via the Azure Command Line Interface (CLI). If you need help, [checkout our website](https://www.kwazi.io).

The simplest way to get started is to create a main.tf file with the minimum configuration options. You can use the following as a template:

```HCL
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
  network_primary_cidr_block = "10.X.0.0/16"
  network_tags_name          = "REPLACE_WITH_NETWORK_NAME"

  subnets_private = [
    {
      cidr = "10.X.0.0/19",
      name = "private-a",
      zone = "a",
    },
    {
      cidr = "10.X.32.0/19",
      name = "private-b",
      zone = "b",
    },
    {
      cidr = "10.X.64.0/19",
      name = "private-c",
      zone = "c",
    },
  ]

  subnets_public = [
    {
      cidr = "10.X.192.0/20",
      name = "public-a",
      zone = "a",
    },
    {
      cidr = "10.X.208.0/20",
      name = "public-b",
      zone = "b",
    },
    {
      cidr = "10.X.224.0/20",
      name = "public-c",
      zone = "c",
    },
  ]
}

```

In the example above, you should replace the following templated values:

Placeholder | Description
--- | ---
`REPLACE_WITH_NETWORK_NAME` | Replace this w/ a Network Name that Makes Sense for Your Use Case
`X` | Replace the Second Octet Value w/ Any Number from 0 to 255

## Need Help?

Working in a strict environment? Struggling to make design decisions you feel comfortable with? Want help from an expert that you can rely on -- one who won't abandon you when the job is finished?

Check us out at [https://www.kwazi.io](https://www.kwazi.io).

## Designing a Deployment

TODO

## Major Created Resources

TODO

## Usage Examples

The following examples are provided as guidance:

* [examples/complex](examples/complex/main.tf)
* [examples/minimal](examples/minimal/main.tf)
