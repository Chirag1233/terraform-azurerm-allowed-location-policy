# Allowed location Azure policy.

This module will craeted an Azure policy with the list of the allowed locations where the resources can be created. this Azure policy also has a tag which will be provide the exceptions for the provided tag name and tag value. Also, This policy also have a list of the exeception resource list which will check if the resource in to the exeception list they are in the exeption list then it will allow the creation of that resource outside of the allowed location. 


Reference the module to a specific version (recommended):
```hcl
module "AllowedLocation_Policy" {
  source = "../../"
  
    tagName = "Exception"
    tagValues = [
        "allowed",
        "approved"
    ]
    allowedLocations = [
            "Australia Southeast",
            "Australia East",
            "Australia Central",
            "Australia Central 2"
    ]
    listOfResourceTypes = [
            "Microsoft.Compute",
            "Microsoft.Storage"
    ]
    policyScope = "/subscriptions/00000000-0000-0000-000000000000/"
    location = "Australia Central"
    not_scopes = [
        "/subscriptions/00000000-0000-0000-000000000000/",
        "/subscriptions/00000000-0000-0000-000000000000/ResourceGroups/TestRG",
        "/subscriptions/00000000-0000-0000-000000000000/ResourceGroups/TestRG/Microsoft.compute/TestVM"
    ]
    effect = "deny"
    identity_type = "none"
    policy_description = "This is an azure policy to only allowe the resource to be created in allowed regions"
    management_group_name = "CSIRO"
    policy_type = "Custom"
    policy_mode = "All"
}
```

## Parameters

| Name | Type | Default | Description | 
| -- | -- | -- | -- | 
| tagName | string | None | (Required) Provide the tag name which will be used to exempt from the allowed locations. Any resources with this tags will not be forced to be provisoned in allowed locations |
| tagValues | list(string) | None | (Required) Provide the list of allowed value for the exempt tag | 
| allowedLocations | list(string) | None | (Required) Provide the list of the allowed locations | 
| listOfResourceTypes | list(string) | None | (Required) Provide the list of resource type which will be exempt from the allowed locations value. | 
| policyScope | string | None | (Required) Provide the Policy scope where should this assign to example: /subscriptions/00000000-0000-0000-000000000000/"
} | 
| location | string | None | (Optional) Provide the location for Azure policy assignement. This is required if the system asisgned identity gets created.  | 
| not_scopes | list(string) | none | (Optional) Provide the Azure Resources or subcriptions which should be not in scope of this policy | 
| effect | string | deny | (Optional) Provide the Policy Effect allowed values are deny and audit. Default Value are deny | 
| identity_type | string | none | (Optional) Provide the identity type either SystemAssigned or none. Default value is none | 
| policy_description | string | This is an azure policy to only allowe the resource to be created in allowed regions | (Optional) Provide the policy description for the allowed location policy | 
| management_group_name | string | "" | (Optional) Provide the Management Group name where should this policy exists | 
| policy_type | string | Custom | (Optional) Provide the policy type for Allowed location policy. Allowed values are BuiltIn, Custom and NotSpecified. Default value is Custom | 
| policy_mode | string | All | (Optional) Provide the policy mode for the allowed location Azure policy allowed values are All, Indeced or NotSpecified. Default value is All | 

## Outputs

| Name | Type | Description | 
| -- | -- | -- | 
| policy_object | object | Returns the full object of the azure policy Definations. |
| policy_assignment_object | object | Returns the full object of the azure policy assignment. |
