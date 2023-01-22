output "SG_id" {
  value = aws_security_group.avsha_sg.id
}
output "vpc_id" {
  value = aws_vpc.avsha_vpc.id
}
output "subnet_ids" {
  value = tolist(aws_subnet.public_subnets[*].id)
}
output "subnets_name" {
  value = tolist(aws_subnet.public_subnets[*])
}