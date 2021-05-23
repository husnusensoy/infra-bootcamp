resource "google_compute_instance_template" "jack_template" {
  description = "Template for Jack instances"


  name_prefix = "jack-"
  machine_type = "f1-micro"

  region =  data.google_compute_zones.available.names.0

  disk {
    source_image = data.google_compute_image.rhel7.id
  }

  network_interface {
    network="default"

    access_config{

    }
  }

  scheduling {
    preemptible = true
    automatic_restart = false
  }

  metadata_startup_script = file("bootstrap.sh")

  tags = ["allow-health-check"]
}

output "jack_template" {
    value = google_compute_instance_template.jack_template
  
}