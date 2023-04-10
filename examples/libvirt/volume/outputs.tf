output "volume_without_size_id" {
  description = "The id of volume without defined size"
  value       = module.volume_without_size.volume_id 
}

output "volume_with_size_id" {
  description = "The id of volume with defined size"
  value       = module.volume_with_size.volume_id
}
