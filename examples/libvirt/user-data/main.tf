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

module "user_data" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/user_data?ref=v0.2"

  hostname        = "apache"
  osname          = "ubuntu"
}
