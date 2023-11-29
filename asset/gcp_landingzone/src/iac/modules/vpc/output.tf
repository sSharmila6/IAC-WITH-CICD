output "vpc_name" {
  value = google_compute_network.vpc_network.*.id
}
output "vpc_subnets_names"{
  value = google_compute_subnetwork.vpc_subnet.*.id
}
output "vpc_subnet_regions"{
  value = google_compute_subnetwork.vpc_subnet.*.region[*]
}