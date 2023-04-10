terraform {
  required_version = "1.2.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }
  }
}

resource "libvirt_network" "network" {
  name = var.name
  mode = var.mode

  domain    = var.domain
  bridge    = var.bridge
  mtu       = var.mtu
  autostart = var.autostart
  addresses = local.l_addresses

  dynamic "routes" {
    for_each = var.routes != null ? [var.routes] : []
    content {
      cidr    = routes.value.cidr
      gateway = routes.value.gateway
    }
  }

  dynamic "dns" {
    for_each = var.dns != null ? [var.dns] : []
    content {
      local_only = dns.value.local_only

      dynamic "forwarders" {
        for_each = dns.value.forwarders != null ? dns.value.forwarders : []
        content {
          address = forwarders.value.address
          domain  = forwarders.value.domain
        }
      }

      dynamic "hosts" {
        for_each = dns.value.hosts != null ? dns.value.hosts : []
        content {
          hostname = hosts.value.hostname
          ip       = hosts.value.ip
        }
      }

      dynamic "srvs" {
        for_each = dns.value.srvs != null ? dns.value.srvs : []
        content {
          service  = srvs.value.service
          protocol = srvs.value.protocol
          domain   = srvs.value.domain
          target   = srvs.value.target
        }
      }

    }
  }

  dynamic "dhcp" {
    for_each = var.dhcp != null ? [var.dhcp] : []
    content {
      enabled = dhcp.value.enabled
    }
  }

  dynamic "dnsmasq_options" {
    for_each = var.dnsmasq != null ? [var.dnsmasq] : []
    content {
      dynamic "options" {
        for_each = dnsmasq_options.value.options[*]
        content {
          option_name  = options.value.name
          option_value = options.value.value
        }
      }
    }
  }
}
