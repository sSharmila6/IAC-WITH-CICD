resource "google_compute_router" "router" {
  name    = var.router
  region  = var.subnet_regions[1]
  network = "spoke1"
}

resource "google_compute_address" "address" {
  name = "computeaddes-l"
  region = var.subnet_regions[1]
}

resource "google_compute_router_nat" "nat" {
  project                            = var.project_id
  name                               = var.nat
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = google_compute_address.address.*.self_link

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = var.subnets[1]
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
