# Outputs da instância ec2-brabus-p1
output "ec2_ip_p1" {
  value = aws_instance.ec2_brabus_p1.public_ip
}

output "ec2_id_p1" {
  value = aws_instance.ec2_brabus_p1.id
}

# Outputs da instância ec2-brabus-p2
output "ec2_ip_p2" {
  value = aws_instance.ec2_brabus_p2.public_ip
}

output "ec2_id_p2" {
  value = aws_instance.ec2_brabus_p2.id
}

# Outputs da instância ec2-brabus-pv1
output "ec2_ip_pv1" {
  value = aws_instance.ec2_brabus_pv1.public_ip
}

output "ec2_id_pv1" {
  value = aws_instance.ec2_brabus_pv1.id
}

# Outputs da instância ec2-brabus-pv2
output "ec2_ip_pv2" {
  value = aws_instance.ec2_brabus_pv2.public_ip
}

output "ec2_id_pv2" {
  value = aws_instance.ec2_brabus_pv2.id
}