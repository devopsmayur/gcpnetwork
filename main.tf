terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}
# Define provider configuration
provider "google" {
  project     = "hc-a0411e550991411898ee2ce2c2e"
  region      = "us-central1"
}

# Create a GCP Virtual Private Cloud (VPC) network
resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

# Create a subnet within the VPC network
resource "google_compute_subnetwork" "my_subnet" {
  name          = "my-subnet"
  region        = "us-central1"
  network       = google_compute_network.my_network.self_link
  ip_cidr_range = "10.0.0.0/24"
}

# Output the network self-link
output "network_self_link" {
  value = google_compute_network.my_network.self_link
}