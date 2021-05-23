resource "google_compute_target_http_proxy" "jack_lb_proxy" {
  name = "jack-lb-proxy"
  url_map = google_compute_url_map.jack_simple_map.id
}

