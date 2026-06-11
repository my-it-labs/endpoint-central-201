output "vpc_id" {
  value = aws_vpc.laboratorios.id
}

output "labs" {
  description = "Por laboratorio: IPs públicas/privadas y IDs de instancia"
  value = {
    for name, m in module.lab : name => {
      subnet_cidr = m.subnet_cidr
      server = {
        instance_id = m.ec_server_id
        private_ip  = m.ec_server_private_ip
        public_ip   = m.ec_server_public_ip
      }
      client1 = {
        instance_id = m.ec_client1_id
        private_ip  = m.ec_client1_private_ip
        public_ip   = m.ec_client1_public_ip
      }
      client2 = {
        instance_id = m.ec_client2_id
        private_ip  = m.ec_client2_private_ip
        public_ip   = m.ec_client2_public_ip
      }
      rdp_hint = "mstsc → IP pública :3389 (usuario Administrator; contraseña vía key pair)"
      ec_console_hint = "http://${m.ec_server_public_ip}:8020"
    }
  }
}
