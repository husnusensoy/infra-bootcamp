resource "google_compute_global_address" "lbIPv4" {
  name = "jack-balancer-ip"
}

output "jack-balancer" {
  value = google_compute_global_address.lbIPv4
}