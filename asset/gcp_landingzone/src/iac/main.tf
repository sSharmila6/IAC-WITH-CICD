module "vpc" {
  source                  = "./modules/vpc"
  project_id              = var.project_id
  vpc_name                = var.vpc_name
  subnets                 = var.subnets
  cidr_range              = var.cidr_range
  subnet_regions          = var.subnet_regions
  private_ip_google_access= var.private_ip_google_access
  subnet_zone             = var.subnet_zone
  auto_create_subnetworks = var.auto_create_subnetworks 
}

module "network_peering" {
  source                = "./modules/network_peering"
  #depends_on            = [module.vpc]
  peer1                 = var.peer1
  peer2                 = var.peer2
  vpc_name              = module.vpc.vpc_name
}

module "firewall" {
  source                = "./modules/firewalls"
  firewall_name        = var.firewall_name
  vpc_name              = module.vpc.vpc_name
  protocol              = var.protocol
  ports                 = var.ports 
  source_range          = var.source_range 

}

module "vm" {
  source         = "./modules/compute"
  #depends_on     = [module.vpc]
  instance_name  = var.instance_name
  machine        = var.machine
  subnet_zone    = var.subnet_zone
  vpc_name       = var.vpc_name
  subnets        = module.vpc.vpc_subnets_names
  network       = module.vpc.vpc_name
  startup_script = var.startup_script
  #internal_ip    = var.internal_ip
  pinstance_name  = var.pinstance_name
}

module "cluster" {
  source = "./modules/gke"
  #depends_on     = [module.vpc]
  project_id = var.project_id 
  auto_create_subnetworks = var.auto_create_subnetworks
  firewall_name = var.firewall_name[0] 
  protocol = var.protocol 
  source_range = var.source_range 
  zone = var.zone 
  #key = var.key 
 network     = module.vpc.vpc_name
 vpc_name = var.vpc_name
  subnets= module.vpc.vpc_subnets_names
  pods_ipv4_cidr_block = var.pods_ipv4_cidr_block 
  services_ipv4_cidr_block = var.services_ipv4_cidr_block
  cluster_name = var.cluster_name

}

module "vm_nat" {
  source = "./modules/NAT"
  #depends_on     = [module.vpc]
  project_id = var.project_id 
  router= var.router 
  network     = module.vpc.vpc_name
  vpc_name = var.vpc_name
  subnets= module.vpc.vpc_subnets_names
  nat = var.nat
  subnet_regions = var.subnet_regions

}


module "gke_nat" {
  source = "./modules/gke_nat"
  #depends_on     = [module.vpc]
  project_id = var.project_id 
  router2 = var.router2
  network     = module.vpc.vpc_name
  vpc_name = var.vpc_name
  subnets= module.vpc.vpc_subnets_names
  spoke3_nat = var.spoke3_nat
  subnet_regions = var.subnet_regions

}


module "monitoring" {
  source = "./modules/monitoring"
  project_id = var.project_id
  email = var.email 
  notification_type = var.notification_type
  address_type = var.address_type
  duration_time = var.duration_time
  combiner = var.combiner
  threshold = var.threshold
  pinstance_name = var.pinstance_name 
}