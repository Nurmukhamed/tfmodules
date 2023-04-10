variable "network_interface_dynamic" {
  type = object({
    network_name       = string
    is_dhcp_enabled    = bool
    ipv4_address       = string
    ipv4_netmask       = string
    ipv4_gateway       = string
    dns_domains_search = string
    dns_servers        = string
  })
  default = {
    network_name       = "default"
    is_dhcp_enabled    = true
    ipv4_address       = null
    ipv4_netmask       = null
    ipv4_gateway       = null
    dns_domains_search = null
    dns_servers        = null
  }
}

variable "network_interface_static" {
  type = object({
    network_name       = string
    is_dhcp_enabled    = bool
    ipv4_address       = string
    ipv4_netmask       = string
    ipv4_gateway       = string
    dns_domains_search = string
    dns_servers        = string
  })

  default = {
    network_name       = "default"
    is_dhcp_enabled    = false
    ipv4_address       = "192.168.122.20"
    ipv4_netmask       = "24"
    ipv4_gateway       = "192.168.122.1"
    dns_domains_search = "libvirt.local"
    dns_servers        = "192.168.122.1"
  }
}
