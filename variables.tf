variable "cluster_name" {
  default = "tf-gke-cluster"
}

variable "project_id" {
  default = "dpt-cc-2022"
}

variable "region" {
  default = "europe-west1"
}

variable "initial_node_count" {
  default = 1
}

variable "machine_type" {
  default = "n1-standard-2"
}