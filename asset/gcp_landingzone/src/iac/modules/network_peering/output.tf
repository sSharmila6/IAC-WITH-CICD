output "network_peering1" {
  description = "Network peering resource."
  value       = google_compute_network_peering.vpc_peering1.name
}

output "network_peering2" {
  description = "Peer network peering resource."
  value       = google_compute_network_peering.vpc_peering2.name
}