resource "google_artifact_registry_repository" "this" {
  location      = var.repository_location
  repository_id = var.repository_id
  description   = "A Docker repository hosting DBT images"
  format        = "DOCKER"
}
