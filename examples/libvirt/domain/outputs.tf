output "network_interfaces_static" {
  description = "The network interfaces of virtual machine"
  value       = module.domain_static.network_interface
}

output "network_interfaces_dynamic" {
  description = "The network interfaces of virtual machine"
  value       = module.domain_dynamic.network_interface
}
