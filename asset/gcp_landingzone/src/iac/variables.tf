variable "project_id" {
  type = string
}
variable "subnet_regions" {
  type = list(string)
}
variable "vpc_name" {
  type = list(string)
}
variable "cidr_range" {
  type = list(string)
}

variable "subnets" {
  type = list(string)
}

variable "firewall_name" {
  type = list(string)
}

 //variable "key" {
  // type = string
 //}
variable "auto_create_subnetworks" {
  type = bool
}

variable "subnet_zone" {
  type = list(string)
}
variable "protocol" {
  type = string
}
variable "source_range" {
  type = string
}

variable "peer1" {
  type = string
}

variable "peer2" {
  type = string
}

variable "ports" {
  type = list(string) 
}

variable "private_ip_google_access" {
  type  = bool
}

variable "instance_name" {
  type = list(string)
}
variable "machine" {
  type = string
}



variable "startup_script" {
  type = string
}

variable "pinstance_name" {
  type = string
}


variable "cluster_name" {
  type = string
}


variable "zone" {
  type = string
  
}


variable "pods_ipv4_cidr_block" {
  type = string 
  
}

variable "services_ipv4_cidr_block" {
  type = string 
  
}


variable "nat" {
  type = string 
  
}
variable "router" {
  type = string 
  
}

variable "spoke3_nat" {
  type = string 
  
}
variable "router2" {
  type = string 
  
}


variable "email" {
    type = string 
}

variable "notification_type" {
    type = string 
}

variable "address_type" {
    type = string
}

variable "duration_time" {
    type = string 
}

variable "combiner" {
    type = string
}


variable "threshold" {
    type = string
}
