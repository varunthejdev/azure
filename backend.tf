terraform {
  required_version = ">= 0.12"
  # Backend type must be specified here. The details are specified in a separate per-account file
  backend "azurerm" {
    storage_account_name = "69d3xxsaxxaz1xx01"
    container_name       = "tfstate"
    key                  = "azure/iam/azure-custom-roles.tfstate"
    access_key = ""
  }
}

