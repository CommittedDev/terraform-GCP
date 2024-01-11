resource "google_storage_bucket" "my_bucket" {
  name          = var.bucket_name
  location      = "ME-WEST1"
  storage_class = "REGIONAL"

   versioning {
    enabled = true
  }

   labels = {
    "environment" = "production"
  }
}