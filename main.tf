resource "azurerm_role_definition" "custom_roles" {
  count       = length(local.azure_custom_roles_source) 
  name        = jsondecode(file(local.azure_custom_roles_source[count.index]))["Name"]
  scope       = "/subscriptions/efdffea0-3c4e-4cf9-b074-997e13fa69d3"
  description = jsondecode(file(local.azure_custom_roles_source[count.index]))["Description"]
  # The role_definition_id is required to workaround a bug in the AzureRM Terraform module, without it Terraform tries to destroy and recreate the role whenever a small change is made to the config rather than simply update the existing role.  The role_definition_id must be unique hence why the custom.idex is used. 
  role_definition_id = "a999999f-245c-4cce-ab8f-e8c842f3${count.index + 1000}"

  permissions {
    actions     = jsondecode(file(local.azure_custom_roles_source[count.index]))["Actions"]
    not_actions = jsondecode(file(local.azure_custom_roles_source[count.index]))["NotActions"]
  }

  assignable_scopes = formatlist("%s%s", "/subscriptions/", data.azurerm_subscriptions.available.subscriptions.*.subscription_id)
}
