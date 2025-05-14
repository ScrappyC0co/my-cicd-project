output "vpc_id" {
  value = aws_vpc.main.id # This makes the VPC ID available to the root module (so other modules can use it).
}

output "public_subnet_ids" {
  value = [aws_subnet.public_a.id] # Outputs the subnet ID, wrapped in a list ([...]) 
}                                  # so it's consistent even if we later add more subnets.

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}
