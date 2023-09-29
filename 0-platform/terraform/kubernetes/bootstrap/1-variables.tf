variable "project_id" {
  description = "The project ID to host the cluster in"
  default = "ambient-stone-394013"
}

variable "bucket_name" {
  description = "Bucket name use by kubernetes engine for terraform state"
  default = "gke-ambient-stone-tf-state-staging"
}

variable "location" {
  description = "location for bucket"
  default = "europe-west1"
}