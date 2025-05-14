output "vpc_id" {
  value = module.networking.vpc_id # Exports the VPC ID created in the networking module.
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids # Exports the IDs of our public subnets.
}
