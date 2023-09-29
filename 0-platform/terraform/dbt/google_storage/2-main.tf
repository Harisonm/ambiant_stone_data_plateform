resource "google_project_service" "this" {
  for_each = toset(local.services_apis)

  service = each.value
}

resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = var.location
}
