terraform {
  required_version = "1.2.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }
  }
}

resource "libvirt_pool" "pool" {
  name = var.pool_name
  type = var.pool_type
  path = var.pool_path
}
