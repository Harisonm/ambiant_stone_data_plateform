locals {
  services_apis = [
    "iam.googleapis.com",
    "storage.googleapis.com",
  ]
}
provider "google" {
  project = "ambient-stone-394013"
  region  = "europe-west1"
}
