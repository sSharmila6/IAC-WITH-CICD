

output "spoke_node" {

     value  = google_container_node_pool.app_cluster_node_pool.name
}

output "public_node" {

     value  = google_container_node_pool.primary_preemptible_nodes.name
}
