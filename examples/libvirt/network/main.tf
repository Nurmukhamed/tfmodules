terraform {
  required_version = "= 1.4.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }
}

provider "libvirt" {
  # Configuration options
}

#module "network" {
#  # Simple network, only mandatory fields.
#
#  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network?ref=v0.2"
#
#  name = "example"
#  mode = "none"
#
#}

#module "network" {
#  # Simple network with addresses are set and dhcp is enabled.
#
#  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network?ref=v0.2"
#
#  name = "example"
#  mode = "nat"
#  addresses = [ "192.168.123.0/24"]
#
#}

#module "network" {
#  # Simple network with addresses are set and dhcp is disabled.
#
#  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network?ref=v0.2"
#
#  name = "example"
#  mode = "nat"
#  dhcp = {
#    enabled = false
#  }
#  addresses = ["192.168.123.0/24"]
#}

module "network" {
  # Simple network with dns settings, adding hosts records. Dns domain is set.

  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network?ref=v0.2"

  name      = "example"
  mode      = "nat"
  addresses = {
     ipv4 = "192.168.123.0/24"
     ipv6 = "2001:db8:ca2:2::1/64"
  }
  domain    = "example.local"
  dns = {
    enabled    = true
    local_only = false
    hosts = [
      { hostname = "public.example.local"
        ip       = "192.168.123.10"
      }
    ]
    srvs = null
    forwarders = null
  }
}
