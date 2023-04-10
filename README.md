# tfmodules

A terraform modules for everyday use.

## Libvirt modules

These are used to create virtual machine in Linux/KVM/QEMU environment.

---------------
| name | desciption |
|------|------------|
| commoninit | Module to create cloud-init iso image |
| domain | Module to create virtual machines |
| network | Module to create virtual network |
| network_config | Module to generate network config |
| pool | Module to create pool |
| user-data | Module to generate user-data |
| volume | Module to create volumes |

**Requirement**

```
terraform {
  required_version = "1.2.4"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }
  }
}
```

**Supported OSes**

* Ubuntu 20.04
* CentOS 7
* CentOS 8
* AlmaLinux 8
* AlmaLinux 9

**Downloading images**

ISO images and QCOW2 images are needed to create virtual machines.

```
mkdir ~/ISO
cd ~/ISO
wget https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.4.2105-20210603.0.x86_64.qcow2
wget https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2
wget https://cloud-images.ubuntu.com/releases/hirsute/release/ubuntu-21.04-server-cloudimg-amd64-disk-kvm.img
wget https://cloud-images.ubuntu.com/releases/hirsute/release/ubuntu-20.04-server-cloudimg-amd64-disk-kvm.img
wget https://repo.almalinux.org/almalinux/8/cloud/x86_64/images/AlmaLinux-8-GenericCloud-latest.x86_64.qcow2
wget https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-latest.x86_64.qcow2 
```

Use variable **imagedir** for pointing to place where images are.
