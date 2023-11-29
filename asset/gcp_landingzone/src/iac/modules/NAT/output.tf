
output "router" {
    value = google_compute_router.router.name
}
output "nat" {
    value  = google_compute_router_nat.nat.name
}