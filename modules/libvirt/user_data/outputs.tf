output "user_data" {
  description = "The rendered user-data"
  value       = data.template_file.user_data.rendered
}
