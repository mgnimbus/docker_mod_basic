
locals {
  no_of_container = length(lookup(var.external, var.env))
}

resource "random_string" "random" {
  count   = local.no_of_container
  length  = 4
  special = false
  upper   = false
}

module "image" {
  source       = "./image"
  docker_image = lookup(var.docker_image, var.env)
}

module "container" {
  source = "./container"
  count  = local.no_of_container

  docker_image = lookup(var.docker_image, var.env)

  docker_container = "nodered-container-${random_string.random[count.index].id}"
  internal         = var.internal
  external         = lookup(var.external, var.env)[count.index]
  protocol         = "tcp"
  container_path   = "/data"
  host_path        = "${path.cwd}/dockervol/"
}

resource "null_resource" "docker_volume" {
  provisioner "local-exec" {
    command = "mkdir dockervol/ || true && chown -R 1000:1000 dockervol/"
  }
}