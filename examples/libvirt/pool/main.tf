terraform {
  required_version = "= 1.2.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }
  }
}

provider "libvirt" {
  # Configuration options
}

module "pool" {
  source = "git::ssh://git@github.com:Nurmukhamed/tfmodules.git/modules/libvirt/pool?ref=v0.1"

  pool_name = "ansible"
  pool_type = "dir"
  pool_path = "/var/lib/libvirt/images/pool-ansible"
}
