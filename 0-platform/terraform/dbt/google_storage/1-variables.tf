variable "project_id" {
  description = "The project ID to host the cluster in"
  default = "ambient-stone-394013"
}

variable "location" {
  description = "location for bucket"
  default = "europe-west1"
}

variable "bucket_name" {
  description = "Dataset holding all DBT generated tables"
  default = "ambient-stone-raw-data"
}