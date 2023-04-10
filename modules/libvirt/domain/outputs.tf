output "domain_name" {
  description = "The domain name"
  value       = libvirt_domain.domain.name
}

output "network_interface" {
  description = "The domain network address"
  value       = libvirt_domain.domain.network_interface
}
