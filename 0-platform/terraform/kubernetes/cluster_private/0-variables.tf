variable "project_id" {
  description = "The project ID to host the cluster in"
  default = "ambient-stone-394013"
}

variable "region" {
  description = "The region the cluster in"
  default     = "europe-west1"
}

variable "location" {
  description = "The region the cluster in"
  default     = "europe-west1"
}

variable "node_locations" {
  description = "The region the cluster in"
  default     = "europe-west1-b"
}

variable "bucket" {
  description = ""
  default     = "gke-ambient-stone-tf-state-staging"
}

variable "account_id" {
  description = ""
  default     = "gke-ambient-stone"  
}

variable "cluster_name" {
  description = ""
  default     = "as-394013-sample-cluster"  
}

variable "node_name" {
  description = ""
  default     = "as-394013-sample-node"  
}

variable "spot_name" {
  description = ""
  default     = "as-394013-sample-spot"  
}

variable "machine_type" {
  description = ""
  default     = "e2-standard-2"
}

