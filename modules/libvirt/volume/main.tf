terraform {
  required_version = "1.4.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }
}

resource "libvirt_volume" "os_base_image" {
  name   = "os_image_${var.osname}"
  pool   = var.pool_name
  source = "${var.imagedir}/${var.base_images["${var.osname}"]}"
  format = "qcow2"
}

resource "libvirt_volume" "volume_without_size" {
  count          = var.volume_size == null ? 1 : 0
  name           = var.volume_name
  base_volume_id = libvirt_volume.os_base_image.id
  pool           = var.pool_name
}

resource "libvirt_volume" "volume_with_size" {
  count          = var.volume_size == null ? 0 : 1
  name           = var.volume_name
  base_volume_id = libvirt_volume.os_base_image.id
  pool           = var.pool_name
  size           = var.volume_size
}
