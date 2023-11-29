resource "google_compute_network_peering" "vpc_peering1" {

name                    =  var.peer1

network = var.vpc_name[0]

peer_network = var.vpc_name[1]

}



resource "google_compute_network_peering" "vpc_peering2" {

name                    =  var.peer2

network = var.vpc_name[0]

peer_network = var.vpc_name[2]

}