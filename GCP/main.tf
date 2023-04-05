terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  region = "us-central1"
  zone   = "us-central1-c"
  credentials = file(var.gcp_auth_file)
}

resource "google_compute_instance" "terraform" {
  project      = "adept-turbine-382610"
  name         = "terraform"
  machine_type = "n1-standard-2"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}