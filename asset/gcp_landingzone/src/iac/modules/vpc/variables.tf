variable "subnet_regions" {
  type    = list(string)
}
variable "vpc_name" {
  type    = list(string)
}
variable "cidr_range" {
  type    = list(string)
}
variable "subnets" {
  type    = list(string)
}

variable "auto_create_subnetworks" {
  type    = bool
}
variable "project_id" {
  type    = string
}
variable "subnet_zone" {
  type    = list(string)
}

variable "private_ip_google_access" {
  type = string
}