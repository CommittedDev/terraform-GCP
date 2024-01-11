output "private_vm_ip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}

output "public_vm_ip" {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}

output "public_db_ip" {
  value = google_sql_database_instance.db_instance.ip_address.0.ip_address
}

output "db_connection_name" {
  value = google_sql_database_instance.db_instance.connection_name
}

output "google_sql_user" {
  value = google_sql_user.user.name
}

output "database_name" {
  value = google_sql_database.database.name
}

output "bucket_name" {
  value = var.bucket_name
}




