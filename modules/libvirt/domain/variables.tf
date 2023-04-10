variable "domain_name" {
  type        = string
  description = "A Virtual Machine Name"
}

variable "domain_memory" {
  type        = number
  description = "Amount Virtual Machine Memory"
  default     = 512
}

variable "domain_vcpu" {
  type        = number
  description = "Amount Virtual Machine VCPUs"
  default     = 1
}

variable "volume_size" {
  type        = number
  description = "Volume for Virtual machine"
  default     = null
}

variable "pool_name" {
  type        = string
  description = "Pool name"
}

variable "imagedir" {
  type        = string
  description = "A folder name"
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

variable "network_interface" {
  type = object({
    network_name       = string
    is_dhcp_enabled    = bool
    ipv4_address       = string
    ipv4_netmask       = string
    ipv4_gateway       = string
    dns_domains_search = string
    dns_servers        = string
  })
}
