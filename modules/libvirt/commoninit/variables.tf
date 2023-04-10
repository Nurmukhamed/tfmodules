variable "hostname" {
  type        = string
  description = "Virtual Machine Name"
}

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

variable "commoninit_name" {
  type        = string
  description = "Common init iso file name"
}

variable "pool_name" {
  type        = string
  description = "Disk pool name"
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
