resource "oci_fleet_apps_management_catalog_item" "fleet_apps_management_catalog_items" {
  for_each = var.fleet_apps_management_catalog_items

  compartment_id             = each.value.compartment_id
  config_source_type         = each.value.config_source_type
  description                = each.value.description
  display_name               = each.value.display_name
  package_type               = each.value.package_type
  clone_catalog_item_trigger = each.value.clone_catalog_item_trigger
  defined_tags               = each.value.defined_tags
  freeform_tags              = each.value.freeform_tags
  listing_id                 = each.value.listing_id
  listing_version            = each.value.listing_version
  short_description          = each.value.short_description
  time_released              = each.value.time_released
  version_description        = each.value.version_description

  dynamic "catalog_source_payload" {
    for_each = each.value.catalog_source_payload != null ? [each.value.catalog_source_payload] : []
    content {
      access_uri                       = catalog_source_payload.value.access_uri
      branch_name                      = catalog_source_payload.value.branch_name
      bucket                           = catalog_source_payload.value.bucket
      config_source_type               = catalog_source_payload.value.config_source_type
      configuration_source_provider_id = catalog_source_payload.value.configuration_source_provider_id
      description                      = catalog_source_payload.value.description
      listing_id                       = catalog_source_payload.value.listing_id
      long_description                 = catalog_source_payload.value.long_description
      namespace                        = catalog_source_payload.value.namespace
      object                           = catalog_source_payload.value.object
      repository_url                   = catalog_source_payload.value.repository_url
      template_display_name            = catalog_source_payload.value.template_display_name
      time_expires                     = catalog_source_payload.value.time_expires
      version                          = catalog_source_payload.value.version
      working_directory                = catalog_source_payload.value.working_directory
      zip_file_base64encoded           = catalog_source_payload.value.zip_file_base64encoded
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

