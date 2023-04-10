variable "hostname" {
  type        = string
  description = "Virtual Machine Name"
}

variable "osname" {
  type        = string
  description = "Virtual Machine OS Name"
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
