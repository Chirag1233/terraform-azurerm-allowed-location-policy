locals {
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

module "AllowedLocation_Policy" {
  source = "../../"
  
    tagName                   = local.tagName
    tagValues                 = local.tagValues
    allowedLocations          = local.allowedLocations
    listOfResourceTypes       = local.listOfResourceTypes
    location                  = local.location
    not_scopes                = local.not_scopes
    effect                    = local.effect
    identity_type             = local.identity_type
    policy_description        = local.policy_description
    management_group_name     = local.management_group_name
    policy_type               = local.policy_type
    policy_mode               = local.policy_mode
}