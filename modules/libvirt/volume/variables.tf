variable "base_images" {
  type = map(any)
  default = {
    "centos7"    = "CentOS-7-x86_64-GenericCloud.qcow2"
    "centos8"    = "CentOS-8-GenericCloud-8.4.2105-20210603.0.x86_64.qcow2"
    "almalinux8" = "AlmaLinux-8-GenericCloud-8.6-20220513.x86_64.qcow2"
    "almalinux9" = "AlmaLinux-9-GenericCloud-9.0-20220527.x86_64.qcow2"
    "ubuntu"     = "ubuntu-20.04-server-cloudimg-amd64-disk-kvm.img"
  }
}

variable "osname" {
  type        = string
  description = "A OS of virtual machine"
  validation {
    condition = anytrue([
      var.osname == "centos7",
      var.osname == "centos8",
      var.osname == "almalinux8",
      var.osname == "almalinux9",
      var.osname == "ubuntu"
    ])
    error_message = "Unsupported OS name"
  }
}

variable "imagedir" {
  type        = string
  description = "A folder name"
}

variable "volume_name" {
  type        = string
  description = "A name of disk"
}

variable "pool_name" {
  type        = string
  description = "A disk pool name"
}

variable "volume_size" {
  type        = number
  description = "A disk size, in MB"
  default     = null
}
