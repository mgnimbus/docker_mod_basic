variable "docker_container" {
  description = "docker_container to install the image"
  type        = string
}

variable "docker_image" {
  description = "Docker image you need"
  type        = string
}

variable "env" {
  type        = string
  description = "Env to deploy to"
  default     = "dev"
}

variable "internal" {}

variable "external" {}


variable "container_path" {}

variable "host_path" {}

variable "protocol" {}