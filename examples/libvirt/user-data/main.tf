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

module "user_data" {
  source = "git::ssh://git@github.com:Nurmukhamed/tfmodules.git/modules/libvirt/user_data?ref=v0.1"

  hostname        = "apache"
  osname          = "ubuntu"
}
