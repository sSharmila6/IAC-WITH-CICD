
output "router2" {
    value = google_compute_router.router.name
}
output "spoke3_nat" {
    value  = google_compute_router_nat.nat.name
}

