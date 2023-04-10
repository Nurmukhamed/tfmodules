output "network_config" {
  description = "The rendered network_config"
  value       = var.network_interface.is_dhcp_enabled ? data.template_file.network_config_dynamic[0].rendered : data.template_file.network_config_static[0].rendered 
}

