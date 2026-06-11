locals {
  subnet_cidr = "10.0.${var.lab_index}.0/24"

  # IPs fijas dentro de la subred (equivalente al lab Vagrant .10 / .11 / .12)
  server_ip  = cidrhost(local.subnet_cidr, 10)
  client1_ip = cidrhost(local.subnet_cidr, 11)
  client2_ip = cidrhost(local.subnet_cidr, 12)

  common_tags = merge(var.tags, {
    Lab  = var.lab_name
    Role = "endpoint-central-lab"
  })
}

# --- Subred pública del laboratorio (una por lab) ---
resource "aws_subnet" "lab" {
  vpc_id                  = var.vpc_id
  cidr_block              = local.subnet_cidr
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "${var.lab_name}-subnet"
  })
}

# Tabla de rutas propia: solo esta subred → Internet (no comparte RT con otros labs)
resource "aws_route_table" "lab" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = merge(local.common_tags, {
    Name = "${var.lab_name}-rt"
  })
}

resource "aws_route_table_association" "lab" {
  subnet_id      = aws_subnet.lab.id
  route_table_id = aws_route_table.lab.id
}

# NACL: aislar tráfico entre subredes de distintos labs dentro de la misma VPC
resource "aws_network_acl" "lab" {
  vpc_id     = var.vpc_id
  subnet_ids = [aws_subnet.lab.id]

  # Tráfico interno del lab
  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.subnet_cidr
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.subnet_cidr
    from_port  = 0
    to_port    = 0
  }

  # RDP desde Internet (simplificado para el curso)
  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 3389
    to_port    = 3389
  }

  # Consola EC + agente (acceso desde fuera del lab si hace falta)
  ingress {
    rule_no    = 111
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8020
    to_port    = 8020
  }

  ingress {
    rule_no    = 112
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8383
    to_port    = 8383
  }

  ingress {
    rule_no    = 113
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8027
    to_port    = 8027
  }

  ingress {
    rule_no    = 114
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8443
    to_port    = 8443
  }

  ingress {
    rule_no    = 115
    protocol   = "udp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8443
    to_port    = 8443
  }

  ingress {
    rule_no    = 116
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8444
    to_port    = 8444
  }

  # Bloquear tráfico hacia/desde otras subredes de la VPC (otros labs)
  ingress {
    rule_no    = 900
    protocol   = "-1"
    action     = "deny"
    cidr_block = var.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 900
    protocol   = "-1"
    action     = "deny"
    cidr_block = var.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  # Internet (después del deny VPC: destinos fuera de 10.0.0.0/16)
  egress {
    rule_no    = 200
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(local.common_tags, {
    Name = "${var.lab_name}-nacl"
  })
}

# Un security group por laboratorio: todo el tráfico entre VMs del mismo lab
resource "aws_security_group" "lab" {
  name        = "${var.lab_name}-sg"
  description = "Lab ${var.lab_name}: tráfico libre intra-lab + EC/RDP público"
  vpc_id      = var.vpc_id

  ingress {
    description = "Todo entre instancias del mismo lab"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  ingress {
    description = "RDP desde cualquier origen"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Endpoint Central HTTP (consola + agente)"
    from_port   = 8020
    to_port     = 8020
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Endpoint Central HTTPS (consola + agente)"
    from_port   = 8383
    to_port     = 8383
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Endpoint Central notification server"
    from_port   = 8027
    to_port     = 8027
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Endpoint Central remote control (SSL)"
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Endpoint Central remote control (SSL, UDP)"
    from_port   = 8443
    to_port     = 8443
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Endpoint Central remote control / Tools"
    from_port   = 8444
    to_port     = 8444
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Salida libre"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${var.lab_name}-sg"
  })
}

# --- Instancias Windows ---
resource "aws_instance" "ec_server" {
  ami                         = var.ami_server
  instance_type               = var.instance_type_server
  subnet_id                   = aws_subnet.lab.id
  vpc_security_group_ids      = [aws_security_group.lab.id]
  key_name                    = var.key_name
  private_ip                  = local.server_ip
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.root_volume_server_gb
    volume_type = "gp3"
  }

  tags = merge(local.common_tags, {
    Name = "${var.lab_name}-ec-server"
  })
}

resource "aws_instance" "ec_client1" {
  ami                         = var.ami_client
  instance_type               = var.instance_type_client
  subnet_id                   = aws_subnet.lab.id
  vpc_security_group_ids      = [aws_security_group.lab.id]
  key_name                    = var.key_name
  private_ip                  = local.client1_ip
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.root_volume_client_gb
    volume_type = "gp3"
  }

  tags = merge(local.common_tags, {
    Name = "${var.lab_name}-ec-client1"
  })
}

resource "aws_instance" "ec_client2" {
  ami                         = var.ami_client
  instance_type               = var.instance_type_client
  subnet_id                   = aws_subnet.lab.id
  vpc_security_group_ids      = [aws_security_group.lab.id]
  key_name                    = var.key_name
  private_ip                  = local.client2_ip
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.root_volume_client_gb
    volume_type = "gp3"
  }

  tags = merge(local.common_tags, {
    Name = "${var.lab_name}-ec-client2"
  })
}
