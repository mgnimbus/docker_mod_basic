variable "docker_image" {
  type        = map(string)
  description = "Image to use for provisioning"
  default = {
    dev  = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}

variable "env" {
  type        = string
  description = "Env to deploy to"
  default     = "dev"
}

variable "internal" {
  type    = number
  default = "1880"
  validation {
    condition     = var.internal == 1880
    error_message = "The internal port must be between 1880."
  }
}

variable "external" {
  type = map(any)
  default = {
    dev  = [2000]
    prod = [1900]
  }

  validation {
    condition     = max((var.external)["dev"]...) <= 65535 && min((var.external)["dev"]...) >= 1981
    error_message = "The external port must be between 0 - 65535."
  }
  validation {
    condition     = max((var.external)["prod"]...) <= 1980 && min((var.external)["dev"]...) >= 1881
    error_message = "The external port must be between 0 - 65535."
  }
}