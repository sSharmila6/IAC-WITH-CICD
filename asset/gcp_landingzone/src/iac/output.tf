output "vpc_subnets_names" {
  value = module.vpc.vpc_subnets_names
}

output "vpc_subnet_regions" {
  value = module.vpc.vpc_subnet_regions
}

output "vpc_network_name" {
  value = module.vpc.vpc_name
}


output "network_peering1" {
  description = "Network peering resource."
  value       = module.network_peering.network_peering1
}

output "network_peering2" {
  description = "Network peering resource."
  value       = module.network_peering.network_peering2
}
output "firewall_name" {
  value = module.firewall.firewall_name
}

output "spoke_instances" {

  value = module.vm.compute_instance
}

output "hub_instance" {

  value = module.vm.hub_instance
}


output "spoke_node" {

  value = module.cluster.spoke_node
}

output "public_node" {

  value = module.cluster.public_node
}


output "router1" {
    value = module.vm_nat.router
}
output "nat1" {
    value  = module.vm_nat.nat
}

// output "router2" {
//     value = module.vm_nat.router2
// }
// output "spoke3_nat" {
//     value  = module.vm_nat.spoke3_nat
// }