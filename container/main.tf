resource "docker_container" "nodered" {
  name  = var.docker_container
  image = var.docker_image
  ports {
    internal = var.internal
    external = var.external
    protocol = var.protocol
  }
  volumes {
    container_path = var.container_path
    host_path      = var.host_path
  }
}
