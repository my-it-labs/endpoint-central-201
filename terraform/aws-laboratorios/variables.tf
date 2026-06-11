variable "aws_region" {
  description = "Región AWS"
  type        = string
  default     = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR de la VPC compartida de laboratorios (una sola VPC para todos los labs)"
  type        = string
  default     = "10.0.0.0/16"
}

variable "key_name" {
  description = "Key pair EC2 existente (descifra contraseña Administrator en Windows)"
  type        = string
}

variable "ami_server" {
  description = "AMI Windows Server 2022 (licencia incluida) en la región"
  type        = string
}

variable "ami_client" {
  description = "AMI Windows 10/11 cliente en la región"
  type        = string
}

variable "instance_type_server" {
  type    = string
  default = "t3.large"
}

variable "instance_type_client" {
  type    = string
  default = "t3.medium"
}

variable "root_volume_server_gb" {
  type    = number
  default = 80
}

variable "root_volume_client_gb" {
  type    = number
  default = 60
}

variable "labs" {
  description = <<-EOT
    Mapa de laboratorios. Clave = nombre/id del lab (ej. lab-01, alumno-garcia).
    index = octeto de subred (1-254) → subred 10.0.<index>.0/24
  EOT
  type = map(object({
    index = number
  }))

  validation {
    condition = alltrue([
      for k, v in var.labs : v.index >= 1 && v.index <= 254
    ])
    error_message = "labs.<name>.index debe estar entre 1 y 254."
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}
