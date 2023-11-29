resource "google_compute_firewall" "pre_populated" {
  count = length(var.firewall_name)
  name  = "${var.firewall_name[count.index]}"
  network = var.vpc_name[count.index]
  
  allow {
    protocol = var.protocol
    ports    = var.ports
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["${var.source_range}"]
  #default direction ingress,applied to all in vpc,
}