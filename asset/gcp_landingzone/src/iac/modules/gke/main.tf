resource "google_container_cluster" "private_cluster" {
  name     = var.cluster_name 
  location = var.zone

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.pods_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }
  network = "spoke2"	
  subnetwork = "${var.subnets[2]}"

  logging_service = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  maintenance_policy {
    daily_maintenance_window {
      start_time = "02:00"
    }
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block = "192.168.128.0/28"
  }

  release_channel {
      channel = "STABLE"
  }

  addons_config {
    // Enable network policy (Calico)
    network_policy_config {
        disabled = false
      }
  }

  /* Enable network policy configurations (like Calico).
  For some reason this has to be in here twice. */
  network_policy {
    enabled = "true"
  }

}



resource "google_container_node_pool" "app_cluster_node_pool" {
  name           = "my-node-pool"
  location       = google_container_cluster.private_cluster.location
  cluster        = google_container_cluster.private_cluster.name
  node_count     = 1

  autoscaling {
    max_node_count = 1
    min_node_count = 1
  }
  max_pods_per_node = 100

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    disk_size_gb = 10
    labels = {
      cluster = google_container_cluster.private_cluster.name
    }

    shielded_instance_config {
      enable_secure_boot = true
    }

  }
  upgrade_settings {
    max_surge       = 1
    max_unavailable = 1
  }
}

resource "google_container_cluster" "public_cluster" {
  name     = "my-gke-cluster"
  location = var.zone

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.public_cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

  }
}