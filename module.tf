locals {
  tagvaluechecktemplate = jsondecode(file("${path.module}/allowedLocations/allowed_locations.json"))
    parameters = jsonencode({
            "effect": {
                "value": var.effect
            },
            "tagName": {
                "value": var.tagName
            },
            "tagValues": {
                "value": var.tagValues
            },
            "allowedLocations": {
                "value": var.allowedLocations
            },
            "listOfResourceTypes": {
                "value": var.listOfResourceTypes
            }
        })
}

resource "azurerm_policy_definition" "allowed_locations" {
  name                    = "CISRO_allowed_location"
  policy_type             = var.policy_type
  mode                    = var.policy_mode
  display_name            = "CISRO_allowed_location"
  description             = var.policy_description != "" ? var.policy_description : null
  management_group_name   = var.management_group_name != "" ? var.management_group_name : null
  metadata = jsonencode({
    "category": local.tagvaluechecktemplate.category
    })
  policy_rule = jsonencode(local.tagvaluechecktemplate.policy_rule)
  parameters = jsonencode(local.tagvaluechecktemplate.parameters)
}

resource "azurerm_policy_assignment" "allowed_locations_assignment" {
  name                 = "CISRO_allowed_location"
  scope                = var.policyScope
  location             = var.location != "" ? var.location: null
  policy_definition_id = azurerm_policy_definition.allowed_locations.id
  description          = var.policy_description != "" ? var.policy_description: null
  display_name         = "CISRO_allowed_location"
  parameters           = local.parameters
  not_scopes           = length(var.not_scopes) > 0 ? var.not_scopes : null
  identity {
      type = var.identity_type
  }
}
