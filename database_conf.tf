# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "db_instance" {
  name             = "fp-regulation-db-instance"
  region           = var.region
  database_version = "POSTGRES_14"
  settings {
    tier = "db-custom-4-8192"

    ip_configuration {
      authorized_networks {
        name = "committed office ip"
        value = var.committed_ip
      }

      authorized_networks {
        name = "public vm ip"
        value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
      }
    }
  }

  deletion_protection  = "false"
}

resource "google_sql_database" "database" {
  name     = "fp-regulation-database"
  instance = google_sql_database_instance.db_instance.name
}

resource "google_sql_user" "user" {
  name     = "committed"
  instance = google_sql_database_instance.db_instance.name
  password = var.db_user_password
}