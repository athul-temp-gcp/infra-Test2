resource "google_compute_instance" "vmtest01" {
  name         = "vmtest01-instance"
  project      = var.gcp.project
  zone         = "${var.gcp.region}-b"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "Debian GNU/Linux 12 (bookworm)"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral external IP
    }
  }

}

resource "google_compute_firewall" "vmtest01_firewall" {
  name    = "vmtest01-firewall"
  project = var.gcp.project
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}
