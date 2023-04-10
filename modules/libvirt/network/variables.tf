# Mandatory fields
variable "name" {
  description = "A unique name for the resource, required by libvirt"
  type        = string
}

variable "mode" {
  description = "A virtual network mode"
  type        = string
  default     = "nat"

  validation {
    condition = anytrue([
      var.mode == "none",
      var.mode == "nat",
      var.mode == "route",
      var.mode == "open",
      var.mode == "bridge"
    ])
    error_message = "Mode can be none, nat, route, open or bridge"
  }
}

# Optional fields
variable "domain" {
  description = "The domain used by the DNS server."
  type        = string
  default     = null
}

#variable "addresses" {
#  description = "A list of (0 or 1) IPv4 or (0 or 1) IPv6 subnets in CIDR notation"
#  type        = list(string)
#  default     = null
#}

variable "addresses" {
  description = "A list of (0 or 1) IPv4 or (0 or 1) IPv6 subnets in CIDR notation"
  type = object({
    ipv4 = string
    ipv6 = string
  })
  default = null
}

variable "bridge" {
  description = "The bridge device defines the name of a bridge device"
  type        = string

  default = null
}

variable "mtu" {
  description = "The MTU to set for the underlying network interfaces"
  type        = number
  default     = null
}

variable "autostart" {
  description = "Set to true to start the network on host boot up"
  type        = bool
  default     = null
}

variable "routes" {
  description = "A list of static routes"
  type = list(object({
    cidr    = string
    gateway = string
  }))
  default = null
}

variable "dns" {
  description = "A configuration of DNS specific settings for the network"
  type = object({
    enabled    = bool
    local_only = bool
    forwarders = list(object({
      address = string
      domain  = string
    }))
    srvs = list(object({
      service  = string
      protocol = string
      domain   = string
      target   = string
    }))
    hosts = list(object({
      ip       = string
      hostname = string
    }))
  })
  default = null
}

variable "dhcp" {
  description = "A DHCP configuration"
  type = object({
    enabled = bool
  })
  default = null
}

variable "dnsmasq" {
  description = "A dnsmasq options"
  type = object({
    options = list(object({
      name  = string
      value = string
    }))
  })
  default = null
}

locals {
  l_ipv4 = var.addresses != null ? var.addresses.ipv4 : ""
  l_ipv6 = var.addresses != null ? var.addresses.ipv6 : ""

  l_ipv4_addresses   = local.l_ipv4 != null || local.l_ipv4 != "" ? [local.l_ipv4] : [""]
  l_ipv6_addresses   = local.l_ipv6 != null || local.l_ipv6 != "" ? [local.l_ipv6] : [""]
  l_concat_addresses = concat(local.l_ipv4_addresses, local.l_ipv6_addresses)
  l_addresses        = compact(local.l_concat_addresses)
}
