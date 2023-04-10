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

module "network_config_ubuntu_dynamic" {
  source = "git::ssh://ggit@github.com:Nurmukhamed/tfmodules.git/modules/libvirt/network_config?ref=v0.2"

  osname          = "ubuntu"
  network_interface = var.network_interface_dynamic
}

module "network_config_ubuntu_static" {
  source = "git::ssh://ggit@github.com:Nurmukhamed/tfmodules.git/modules/libvirt/network_config?ref=v0.2"

  osname          = "ubuntu"
  network_interface = var.network_interface_static
}

module "network_config_centos7_dynamic" {
  source = "git::ssh://ggit@github.com:Nurmukhamed/tfmodules.git/modules/libvirt/network_config?ref=v0.2"

  osname          = "centos7"
  network_interface = var.network_interface_dynamic
}

module "network_config_centos7_static" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network_config?ref=v0.2"

  osname          = "centos7"
  network_interface = var.network_interface_static
}

module "network_config_centos8_dynamic" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network_config?ref=v0.2"

  osname          = "centos8"
  network_interface = var.network_interface_dynamic
}

module "network_config_centos8_static" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network_config?ref=v0.2"

  osname          = "centos8"
  network_interface = var.network_interface_static
}

module "network_config_almalinux8_dynamic" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network_config?ref=v0.2"

  osname          = "almalinux8"
  network_interface = var.network_interface_dynamic
}

module "network_config_almalinux8_static" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network_config?ref=v0.2"

  osname          = "almalinux8"
  network_interface = var.network_interface_static
}

module "network_config_almalinux9_dynamic" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network_config?ref=v0.2"

  osname          = "almalinux9"
  network_interface = var.network_interface_dynamic
}

module "network_config_almalinux9_static" {
  source = "git::https://github.com/Nurmukhamed/tfmodules.git//modules/libvirt/network_config?ref=v0.2"

  osname          = "almalinux9"
  network_interface = var.network_interface_static
}
