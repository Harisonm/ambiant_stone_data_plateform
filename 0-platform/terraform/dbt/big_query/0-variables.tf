variable "project_id" {
  description = "The project ID to host the cluster in"
  default = "ambient-stone-394013"
}

variable "location" {
  description = "location holding all DBT generated tables"
  default = "europe-west1"
}

variable "dataset_id" {
  description = "Dataset Id holding all DBT generated tables"
  default = "dbt_data"
}

variable "account_id" {
  description = "A Service Account for DBT workload"
  default = "dbt-sa"
}

variable "repository_id" {
  description = "Repository Name for DBT plateform"
  default = "ambiant-stone-dbt-platform"
}

variable "repository_location" {
  description = "Repository location for DBT plateform"
  default = "europe-west1"
}