resource "google_compute_instance" "private_instance" {
  count        = length(var.instance_name)
  name         = "${var.instance_name[count.index]}"
  zone         = var.subnet_zone[1] 
  tags         = ["http-server"]
  machine_type = var.machine
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  metadata_startup_script = file(var.startup_script)
  network_interface {
    network     =  "${var.vpc_name[1]}"
    #network      = "spoke1"
    subnetwork  =  "${var.subnets[1]}"
    
  }
}

resource "google_compute_instance" "public_instance" {
  name         = var.pinstance_name
  zone         = var.subnet_zone[0] 
  tags         = ["http-server"]
  machine_type = var.machine
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  metadata_startup_script = file(var.startup_script)
  network_interface {
    network     =  "${var.vpc_name[0]}"
    #network      = "hub"
    subnetwork  =  "${var.subnets[0]}"
    access_config  {
    }
  }
}