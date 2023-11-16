output "subnet_ids" {
  value = aws_subnet.secondary_private_subnets[*].id
}