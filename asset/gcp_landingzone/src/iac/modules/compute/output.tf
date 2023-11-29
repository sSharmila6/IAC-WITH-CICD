
output "machine_type" {
    value = google_compute_instance.private_instance.*.machine_type
}
output "compute_instance" {
    value  = google_compute_instance.private_instance.*.name
}

output "hub_instance" {

     value  = google_compute_instance.public_instance.name
}