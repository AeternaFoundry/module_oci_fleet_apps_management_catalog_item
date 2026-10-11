variable "fleet_apps_management_catalog_items" {
  description = <<EOT
Map of fleet_apps_management_catalog_items, attributes below
Required:
    - compartment_id
    - config_source_type
    - description
    - display_name
    - package_type
Optional:
    - clone_catalog_item_trigger
    - defined_tags
    - freeform_tags
    - listing_id
    - listing_version
    - short_description
    - time_released
    - version_description
    - catalog_source_payload (block):
        - access_uri (optional)
        - branch_name (optional)
        - bucket (optional)
        - config_source_type (required)
        - configuration_source_provider_id (optional)
        - description (optional)
        - listing_id (optional)
        - long_description (optional)
        - namespace (optional)
        - object (optional)
        - repository_url (optional)
        - template_display_name (optional)
        - time_expires (optional)
        - version (optional)
        - working_directory (optional)
        - zip_file_base64encoded (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id             = string
    config_source_type         = string
    description                = string
    display_name               = string
    package_type               = string
    clone_catalog_item_trigger = optional(number)
    defined_tags               = optional(map(string))
    freeform_tags              = optional(map(string))
    listing_id                 = optional(string)
    listing_version            = optional(string)
    short_description          = optional(string)
    time_released              = optional(string)
    version_description        = optional(string)
    catalog_source_payload = optional(object({
      access_uri                       = optional(string)
      branch_name                      = optional(string)
      bucket                           = optional(string)
      config_source_type               = string
      configuration_source_provider_id = optional(string)
      description                      = optional(string)
      listing_id                       = optional(string)
      long_description                 = optional(string)
      namespace                        = optional(string)
      object                           = optional(string)
      repository_url                   = optional(string)
      template_display_name            = optional(string)
      time_expires                     = optional(string)
      version                          = optional(string)
      working_directory                = optional(string)
      zip_file_base64encoded           = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.fleet_apps_management_catalog_items : (
        v.catalog_source_payload == null || (contains([for v in ["GIT_CATALOG_SOURCE", "MARKETPLACE_CATALOG_SOURCE", "PAR_CATALOG_SOURCE", "STACK_TEMPLATE_CATALOG_SOURCE"] : lower(v)], lower(v.catalog_source_payload.config_source_type)))
      )
    ])
    error_message = "must be one of: \"GIT_CATALOG_SOURCE\", \"MARKETPLACE_CATALOG_SOURCE\", \"PAR_CATALOG_SOURCE\", \"STACK_TEMPLATE_CATALOG_SOURCE\""
  }
}

