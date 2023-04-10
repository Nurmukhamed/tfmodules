output "user_data" {
  description = "The rendered user-data"
  value       = module.user_data.user_data
}

output "network_config" {
  description = "The rendered network_config"
  value       = module.network_config.network_config
}

output "commoninit_id" {
  description = "The id of commoninit"
  value       = libvirt_cloudinit_disk.commoninit.id
}
