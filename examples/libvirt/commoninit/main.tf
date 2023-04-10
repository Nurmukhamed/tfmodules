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

resource "random_string" "random_suffix" {
  length  = 3
  special = false
  upper   = false
}

module "pool" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/pool?ref=v0.1"

  pool_name = "ansible"
  pool_type = "dir"
  pool_path = "/var/lib/libvirt/images/pool-ansible"
}

module "commoninit_dynamic" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/commoninit?ref=v0.1"

  hostname          = "test-ubuntu"
  osname            = "ubuntu"
  network_interface = var.network_interface_dynamic
  commoninit_name   = "cloudinit-test-ubuntu-${random_string.random_suffix.result}.iso"
  pool_name         = module.pool.pool_name
}

module "commoninit_static" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/commoninit?ref=v0.1"

  hostname          = "test-almalinux"
  osname            = "almalinux8"
  network_interface = var.network_interface_static
  commoninit_name   = "cloudinit-test-almalinux-${random_string.random_suffix.result}.iso"
  pool_name         = module.pool.pool_name
}
