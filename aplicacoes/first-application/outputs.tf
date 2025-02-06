# Outputs da instância ec2-brabus-p1
output "ec2_ip_p1" {
  value = aws_instance.ec2_brabus_p1.public_ip
}

output "ec2_id_p1" {
  value = aws_instance.ec2_brabus_p1.id
}

output "sg_pub_id" {
  value = aws_security_group.sg_ec2_pub1.id
}