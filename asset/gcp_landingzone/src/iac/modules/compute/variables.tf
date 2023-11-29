variable "instance_name" {
  type    =  list(string)
}
variable "machine" {
  type    = string
}
variable "subnets" {
  type  = list(string)
}
variable "vpc_name" {
  type  = list(string)
}
variable "subnet_zone" {
  type  = list(string)
}

variable "startup_script" {
  type  = string 
}


variable "network" {
  type = list(string)
}

variable "pinstance_name" {
  type = string
}