output "container_id" {
  description = "ID of the container"
  value       = docker_container.nginx.id
}