resource "google_compute_url_map" "jack_simple_map" {
  name  = "jack-simple-map"

  default_service = google_compute_backend_service.jack-service.id
}