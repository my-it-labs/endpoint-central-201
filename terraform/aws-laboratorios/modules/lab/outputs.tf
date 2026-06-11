output "subnet_id" {
  value = aws_subnet.lab.id
}

output "subnet_cidr" {
  value = local.subnet_cidr
}

output "security_group_id" {
  value = aws_security_group.lab.id
}

output "ec_server_id" {
  value = aws_instance.ec_server.id
}

output "ec_server_private_ip" {
  value = aws_instance.ec_server.private_ip
}

output "ec_server_public_ip" {
  value = aws_instance.ec_server.public_ip
}

output "ec_client1_id" {
  value = aws_instance.ec_client1.id
}

output "ec_client1_private_ip" {
  value = aws_instance.ec_client1.private_ip
}

output "ec_client1_public_ip" {
  value = aws_instance.ec_client1.public_ip
}

output "ec_client2_id" {
  value = aws_instance.ec_client2.id
}

output "ec_client2_private_ip" {
  value = aws_instance.ec_client2.private_ip
}

output "ec_client2_public_ip" {
  value = aws_instance.ec_client2.public_ip
}
