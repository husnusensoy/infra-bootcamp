resource "google_compute_health_check" "http_health_check" {
  name = "is-jack-ok"

  http_health_check{
      port_name = "http"
  }
}