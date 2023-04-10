variable "osname" {
  type        = string
  description = "Virtual Machine OS Name"
  validation {
    condition = anytrue([
      var.osname == "centos7",
      var.osname == "centos8",
      var.osname == "almalinux8",
      var.osname == "almalinux9",
      var.osname == "ubuntu"
    ])
    error_message = "Unsupported OS name"
  }
}

variable "network_interface_names" {
  type = map(any)
  default = {
    "centos7"    = "eth0"
    "centos8"    = "eth0"
    "almalinux8" = "eth0"
    "almalinux9" = "eth0"
    "ubuntu"     = "ens3"
  }
}

variable "network_interface" {
  type = object({
    is_dhcp_enabled    = bool
    ipv4_address       = string
    ipv4_netmask       = string
    ipv4_gateway       = string
    dns_domains_search = string
    dns_servers        = string
  })
}

