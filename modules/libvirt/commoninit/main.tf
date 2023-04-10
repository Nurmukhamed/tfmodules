terraform {
  required_version = "1.2.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }
  }
}

module "user_data" {
  source = "../user_data"

  hostname = var.hostname
  osname   = var.osname
}

module "network_config" {
  source = "../network_config"

  osname            = var.osname
  network_interface = var.network_interface
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = var.commoninit_name
  user_data      = module.user_data.user_data
  network_config = module.network_config.network_config
  pool           = var.pool_name
}
