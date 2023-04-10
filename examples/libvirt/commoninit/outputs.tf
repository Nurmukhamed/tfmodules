output "user_data_dynamic" {
  description = "The rendered user-data"
  value       = module.commoninit_dynamic.user_data
}

output "network_config_dynamic" {
  description = "The rendered network_config"
  value       = module.commoninit_dynamic.network_config
}

output "commoninit_id_dynamic" {
  description = "The id of commoninit"
  value       = module.commoninit_dynamic.commoninit_id
}

output "user_data_static" {
  description = "The rendered user-data"
  value       = module.commoninit_static.user_data
}

output "network_config_static" {
  description = "The rendered network_config"
  value       = module.commoninit_static.network_config
}

output "commoninit_id_static" {
  description = "The id of commoninit"
  value       = module.commoninit_static.commoninit_id
}
