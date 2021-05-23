resource "google_compute_backend_service" "jack-service" {
  name = "jack-service"

  health_checks = [ google_compute_health_check.http_health_check.id ]

  port_name = "http"
  protocol = "HTTP"

  backend {
    group = google_compute_instance_group_manager.jack_manager.instance_group
  }

}