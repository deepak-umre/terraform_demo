output "public_subnet" {
  value = aws_subnet.public_sub.id
}

output "private_subnet" {
  value = aws_subnet.private_sub.id
}

output "subnet_id" {
  value = aws_subnet.public_sub.id
}

output "security_group_id" {
  value = aws_security_group.my_security.id
}

output "aws_vpc" {
  value = aws_vpc.my_vpc.id
}

