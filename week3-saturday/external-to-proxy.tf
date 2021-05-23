resource "google_compute_global_forwarding_rule" "http_content_rule" {
  name = "http-control-rule"

  ip_address = google_compute_global_address.lbIPv4.id
  port_range = "80"
  target = google_compute_target_http_proxy.jack_lb_proxy.id
}