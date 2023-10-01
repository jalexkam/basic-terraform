output "vpc_id" {
  description = "The Module VPC ID"
  value = aws_vpc.vpc.id    
}

output "public_subnets" {
  description = "The Module public subnets"
  value = aws_subnet.pub[*].id  
}

output "private_subnets" {
  description = "The Module priavte subnets"
  value = aws_subnet.priv[*].id   
}

output "db_subnets" {
  description = "The Module db subnets ID"
  value =aws_subnet.db[*].id  
}

