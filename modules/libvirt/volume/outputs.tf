output "volume_id" {
  description = "The id of volume"
  value       = var.volume_size == null ? libvirt_volume.volume_without_size[0].id : libvirt_volume.volume_with_size[0].id
}
