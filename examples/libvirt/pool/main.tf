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

module "pool" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/pool?ref=v0.2"

  pool_name = "ansible"
  pool_type = "dir"
  pool_path = "/var/lib/libvirt/images/pool-ansible"
}
