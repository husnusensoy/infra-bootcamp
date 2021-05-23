resource "google_compute_firewall" "fw_allow_hc" {
  name = "allow-hc"

  allow{
      protocol = "tcp"
      ports = ["80"]
  }

  direction = "INGRESS"
  network = "default"
  target_tags = ["allow-health-check"]
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}