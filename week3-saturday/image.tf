data "google_compute_image" "rhel7" {
  family = "rhel-7"
  project = "rhel-cloud"

}

# output "list_of_images" {
#   value = data.google_compute_image.rhel7
# }