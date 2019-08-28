provider "azurerm" {
  version = "=1.31.0"
}

data "azurerm_subscriptions" "available" {}

data "azurerm_subscription" "primary" {}

locals {
  azure_custom_roles = [jsondecode(file("azure_custom_roles.json"))][0]
  azure_custom_roles_source = formatlist("%s%s%s%s%s", path.module , "/role-definitions/", "SanTech-", local.azure_custom_roles, ".json")
}

