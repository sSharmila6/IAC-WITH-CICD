output "firewall_name" {
  value = google_compute_firewall.pre_populated.*.id
}
