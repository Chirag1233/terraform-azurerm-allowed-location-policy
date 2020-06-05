output "policy_object" {
  description = "Output Azure policy full object"
  value      = azurerm_policy_definition.allowed_locations
}

output "policy_assignment_object" {
  description = "Output Azure policy full object"
  value      = azurerm_policy_assignment.allowed_locations_assignment
}