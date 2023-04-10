terraform {
  required_version = "1.4.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }
}

resource "libvirt_pool" "pool" {
  name = var.pool_name
  type = var.pool_type
  path = var.pool_path
}
