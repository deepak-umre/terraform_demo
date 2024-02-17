
### vpc variable ###


variable "cidr_block" {
  default = "192.168.0.0/16"
}

variable "project1" {
  default = "dev"
}

variable "publi_cidr_block" {
  default = "192.168.0.0/24"
}

variable "route_destination_cidr_block" {
  default = "0.0.0.0/0"
}

variable "private_route_t_cidr_block" {
  default = "0.0.0.0/0"
}
variable "sc_cidr_ipv4" {
  default = "0.0.0.0/0"
}

variable "from_port" {
  default = "8080"
}

variable "to_port" {
  default = "8080"
}


variable "private_cidr_block" {
  default = "192.168.2.0/24"
}


### EC2 variable ###



variable "ami" {
  default = "ami-02bebd0e8c7688563"
}
variable "instance_type" {
  default = "t3.micro"
}

