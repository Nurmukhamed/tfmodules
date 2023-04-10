output "network_id" {
  description = "The rendered network id"
  value       = libvirt_network.network.id
}

output "network_name" {
  description = "The rendered network name"
  value       = libvirt_network.network.name
}
