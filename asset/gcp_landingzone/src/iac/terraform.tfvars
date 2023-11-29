project_id = "shasha-project"
#key        = "credentials.json"

#VPC_network
vpc_name                = ["hub", "spoke1", "spoke2"]
auto_create_subnetworks = false
#subnets
subnets        = ["subnet1", "subnet2", "subnet3"]
cidr_range     = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
subnet_regions = ["us-central1", "us-central1", "us-central1"]
subnet_zone    = ["us-central1-b", "us-central1-b", "us-central1-b"]
private_ip_google_access = true
#Network peering
peer1 = "peering1"
peer2 = "peering2"
#firewall
firewall_name = ["firewall1", "firewall2", "firewall4"]
protocol      = "tcp"
source_range  = "0.0.0.0/0"
ports                 = ["255", "80", "443" ,"22"]
#internal_source_range = ["10.0.0.0/10", "172.0.0.0/16"]

#vm_instance
instance_name  = ["vm-spoke1", "vms-spoke1"]
machine        = "n1-standard-1"
startup_script = "bootstrap.sh"
#internal_ip    = ["10.26.2.2", "10.26.2.3"]
pinstance_name  = "hub-instance"

#vm_NAT

router = "vm-router"
nat    = "vm-nat-gateway"
#GKE Cluster
zone = "us-central1-a"
pods_ipv4_cidr_block = "10.101.0.0/16"
services_ipv4_cidr_block= "10.102.0.0/16"
cluster_name = "nat-test-cluster"

#gke_nat

router2 = "router-s3"
spoke3_nat    = "natgateway-s3"


#monitoring 

email = "Default Email"
notification_type = "email"
address_type = "shaik.sharmila@dxc.com"
duration_time= "30s"
combiner = "OR"
threshold= "0.9"