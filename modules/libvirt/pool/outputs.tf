output "pool_name" {
  description = "The pool name"
  value       = libvirt_pool.pool.name
}

output "pool_id" {
  description = "The pool id"
  value       = libvirt_pool.pool.id
}
