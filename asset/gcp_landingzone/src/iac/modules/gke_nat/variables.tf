variable "project_id" {
  type  = string 
}


variable "spoke3_nat" {
  type = string 
  
}
variable "router2" {
  type = string 
  
}

variable "vpc_name" {
  type = list(string)
}

variable "network" {
  type = list(string)
}

variable "subnets" {
  type = list(string) 
}

variable "subnet_regions" {
  type = list(string)
}