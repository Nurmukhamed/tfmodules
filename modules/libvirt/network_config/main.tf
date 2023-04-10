terraform {
  required_version = "1.4.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }
}

data "template_file" "network_config_dynamic" {
  count = var.network_interface.is_dhcp_enabled ? 1 : 0
  template = file("${path.module}/network_config_dynamic.cfg.tmpl")
  vars = {
    network_interface_name = "${var.network_interface_names["${var.osname}"]}"
   }
}


data "template_file" "network_config_static" {
  count = var.network_interface.is_dhcp_enabled ? 0 : 1
  template = file("${path.module}/network_config_static.cfg.tmpl")
  vars = {
    network_interface_name = "${var.network_interface_names["${var.osname}"]}"
    ipv4_address           = var.network_interface.ipv4_address
    ipv4_netmask           = var.network_interface.ipv4_netmask
    ipv4_gateway           = var.network_interface.ipv4_gateway
    dns_domains_search     = var.network_interface.dns_domains_search
    dns_servers            = var.network_interface.dns_servers
  }
}
