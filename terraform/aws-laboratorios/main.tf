# VPC única para todos los laboratorios (evita el límite de 5 VPCs por cuenta).
resource "aws_vpc" "laboratorios" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(var.tags, {
    Name = "endpoint-central-laboratorios"
  })
}

resource "aws_internet_gateway" "laboratorios" {
  vpc_id = aws_vpc.laboratorios.id

  tags = merge(var.tags, {
    Name = "endpoint-central-laboratorios-igw"
  })
}

module "lab" {
  source   = "./modules/lab"
  for_each = var.labs

  lab_name  = each.key
  lab_index = each.value.index

  vpc_id              = aws_vpc.laboratorios.id
  vpc_cidr            = var.vpc_cidr
  internet_gateway_id = aws_internet_gateway.laboratorios.id

  ami_server = var.ami_server
  ami_client = var.ami_client

  instance_type_server = var.instance_type_server
  instance_type_client = var.instance_type_client

  root_volume_server_gb = var.root_volume_server_gb
  root_volume_client_gb = var.root_volume_client_gb

  key_name = var.key_name
  tags     = var.tags
}
