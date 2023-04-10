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
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/pool?ref=v0.1"

  pool_name = "ansible"
  pool_type = "dir"
  pool_path = "/var/lib/libvirt/images/pool-ansible"
}

module "volume_without_size" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/volume?ref=v0.1"

  volume_name = "volume_without_size"
  osname      = "almalinux8"
  pool_name   = module.pool.pool_name
  imagedir    = "/home/nartykaly/git/AnsibleForDevops/iso"
}

module "volume_with_size" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/volume?ref=v0.1"

  volume_name = "volume_with_size"
  osname      = "ubuntu"
  volume_size = 5361393152 
  pool_name   = module.pool.pool_name
  imagedir    = "/home/nartykaly/git/AnsibleForDevops/iso"
}
