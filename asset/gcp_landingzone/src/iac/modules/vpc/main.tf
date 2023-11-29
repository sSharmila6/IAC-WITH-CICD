resource "google_compute_network" "vpc_network" {
  count                   = length(var.vpc_name)
  name                    = "${var.vpc_name[count.index]}"
  project                 = var.project_id
  
  auto_create_subnetworks = var.auto_create_subnetworks
}
resource "google_compute_subnetwork" "vpc_subnet" {
  count                    = length(var.subnets)
  name                     = "${var.subnets[count.index]}"
  ip_cidr_range            = var.cidr_range[count.index]
  network                  = google_compute_network.vpc_network[count.index].name
   private_ip_google_access= var.private_ip_google_access
  region                   = var.subnet_regions[count.index]
}