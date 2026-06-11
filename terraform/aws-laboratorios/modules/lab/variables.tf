variable "lab_name" {
  description = "Nombre o id del laboratorio (etiquetas, prefijos)"
  type        = string
}

variable "lab_index" {
  description = "Octeto de subred: 10.0.<lab_index>.0/24"
  type        = number
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "ami_server" {
  type = string
}

variable "ami_client" {
  type = string
}

variable "instance_type_server" {
  type = string
}

variable "instance_type_client" {
  type = string
}

variable "root_volume_server_gb" {
  type = number
}

variable "root_volume_client_gb" {
  type = number
}

variable "key_name" {
  type = string
}

variable "tags" {
  type = map(string)
}
