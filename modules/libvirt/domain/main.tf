terraform {
  required_version = "1.2.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }
  }
}

module "volume" {
  source = "../volume"

  volume_name = var.domain_name
  volume_size = var.volume_size
  pool_name   = var.pool_name
  osname      = var.osname
  imagedir    = var.imagedir
}

module "commoninit" {
  source = "../commoninit"

  hostname          = var.domain_name
  osname            = var.osname
  network_interface = var.network_interface
  commoninit_name   = "cloudinit-${var.domain_name}.iso"
  pool_name         = var.pool_name
}

# Create the machine
resource "libvirt_domain" "domain" {
  name       = var.domain_name
  memory     = var.domain_memory
  vcpu       = var.domain_vcpu
  qemu_agent = true

  cloudinit = module.commoninit.commoninit_id

  dynamic "network_interface" {
    for_each = var.network_interface != null ? [var.network_interface] : []
    content {
      network_name   = network_interface.value.network_name
      wait_for_lease = true
    }
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = module.volume.volume_id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }

}
