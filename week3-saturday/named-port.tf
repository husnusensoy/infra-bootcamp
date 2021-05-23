resource "google_compute_instance_group_named_port" "http_port" {
  group = google_compute_instance_group_manager.jack_manager.name
  zone = data.google_compute_zones.available.names.0  

  name = "http"
  port = 80
}