terraform {
  required_version = "1.4.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init_${var.osname}.cfg.tmpl")
  vars = {
    server_hostname = var.hostname
  }
}
