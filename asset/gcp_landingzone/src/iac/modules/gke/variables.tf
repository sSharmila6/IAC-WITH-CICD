variable "project_id" {
  type  = string 
}
variable "network" {
  type = list(string)
}
variable "auto_create_subnetworks" {
  type = bool
}

variable "firewall_name" {
  type = string
  
}

variable "protocol" {
  type = string
  
}

variable "source_range" {
  type = string
 
}

variable "zone" {
  type = string
  
}

// variable "key" {
//   type = string
  
// }


variable "subnets" {
  type = list(string) 
  
}


variable "vpc_name" {
  type = list(string) 
  
}

variable "pods_ipv4_cidr_block" {
  type = string 
  
}

variable "services_ipv4_cidr_block" {
  type = string 
  
}

variable "cluster_name" {
  type = string
}