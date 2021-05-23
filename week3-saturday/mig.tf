resource "google_compute_instance_group_manager" "jack_manager" {
  name = "jack-group-manager"

  target_size = 3

  base_instance_name = "jack"

  version {
      instance_template = google_compute_instance_template.jack_template.id
  }

  zone = data.google_compute_zones.available.names.0  
}


output "jack_manager" {
  value = google_compute_instance_group_manager.jack_manager
}