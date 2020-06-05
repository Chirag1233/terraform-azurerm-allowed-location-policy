variable "tagName" {
    type = string
    description = "(Required) Provide the tag name which will be used to exempt from the allowed locations. Any resources with this tags will not be forced to be provisoned in allowed locations"
}

variable "tagValues" {
    type = list(string)
    description = "(Required) Provide the list of allowed value for the exempt tag"
}

variable "allowedLocations" {
    type = list(string)
    description = "(Required) Provide the list of the allowed locations"
}

variable "listOfResourceTypes" {
    type = list(string)
    description = "(Required) Provide the list of resource type which will be exempt from the allowed locations value."
}

variable "policyScope" {
    type = string
    description = "(Required) Provide the Policy scope where should this assign to example: /subscriptions/00000000-0000-0000-000000000000/"
}

variable "location" {
    type = string
    description = "(Optional) Provide the location for Azure policy assignement. This is required if the system asisgned identity gets created."
}

variable "not_scopes" {
    type = list(string)
    default = []
    description = "(Optional) Provide the Azure Resources or subcriptions which should be not in scope of this policy"
}

variable "effect" {
    type = string
    description = "(Optional) Provide the Policy Effect allowed values are deny and audit. Default Value are deny"
    default = "deny"
}


variable "identity_type" {
  description = "(Optional) Provide the identity type either SystemAssigned or none. Default value is none"
  default = "none"
}

variable "policy_description" {
type = string
  description = "(Optional) Provide the policy description for the allowed location policy"
  default = "This is an azure policy to only allowe the resource to be created in allowed regions"
}

variable "management_group_name" {
    type = string
  description = "(Optional) Provide the Management Group name where should this policy exists"
  default = ""
}

variable "policy_type" {
    type = string
  default = "Custom"
  description = "(Optional) Provide the policy type for Allowed location policy. Allowed values are BuiltIn, Custom and NotSpecified. Default value is Custom"
}

variable "policy_mode" {
    type = string
  default = "All"
  description = "(Optional) Provide the policy mode for the allowed location Azure policy allowed values are All, Indeced or NotSpecified. Default value is All"
}
