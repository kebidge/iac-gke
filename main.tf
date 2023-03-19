provider "google" {
  project = var.project_id
  region  = var.region
}

variable "project_id" {
    type = string
}

variable "region" {
    type = string
}

variable "cluster_name" {
    type = string
}

variable "initial_node_count" {
    type = number
}

variable "machine_type" {
    type = string
}

variable "disk_size_gb" {
    type = number
}

resource "google_container_cluster" "cluster" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = var.initial_node_count

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  timeouts {
    create = "30m"
  }
}

output "cluster_name" {
  value = google_container_cluster.cluster.name
}