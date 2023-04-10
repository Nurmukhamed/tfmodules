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
  source = "git::ssh://git@github.com:Nurmukhamed/tfmodules.git/modules/libvirt/pool?ref=v0.2"

  pool_name = "ansible"
  pool_type = "dir"
  pool_path = "/var/lib/libvirt/images/pool-ansible"
}

module "domain_static" {
  source = "git::ssh://git@github.com:Nurmukhamed/tfmodules.git/modules/libvirt/domain?ref=v0.2"

  pool_name         = module.pool.pool_name
  domain_name       = "test-static"
  domain_memory     = 2048
  domain_vcpu       = 1
  osname            = "almalinux8"
  imagedir          = "/home/nartykaly/git/AnsibleForDevops/iso"
  network_interface = var.network_interface_static
}

module "domain_dynamic" {
  source = "git::ssh://git@github.com:Nurmukhamed/tfmodules.git/modules/libvirt/domain?ref=v0.2"

  pool_name         = module.pool.pool_name
  domain_name       = "test-dynamic"
  domain_memory     = 2048
  domain_vcpu       = 1
  osname            = "almalinux8"
  imagedir          = "/home/nartykaly/git/AnsibleForDevops/iso"
  network_interface = var.network_interface_dynamic
}
