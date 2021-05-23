# gcloud auth application-default login
provider "google" {
  project = var.project_id
  region = var.region_id
}

# data "google_compute_regions" "available" {
  
# }

# output "list_regions" {
#   value = data.google_compute_regions.available
# }

data "google_compute_zones" "available" {}

# output "list_of_zones" {
#   value = data.google_compute_zones.available
# }