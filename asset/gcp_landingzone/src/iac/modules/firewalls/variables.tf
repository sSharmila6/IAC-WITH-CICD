variable "firewall_name" {
  type    = list(string)
}

variable "protocol" {
  type = string 
}
variable "source_range" {
   type = string
}



variable "vpc_name" {
  type =list(string)
}

variable "ports" {
  type =list(string) 
}