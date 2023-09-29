resource "google_bigquery_dataset" "this" {
  dataset_id  = var.dataset_id
  description = "Dataset holding all DBT generated tables"
  location    = var.location
}
