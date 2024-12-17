output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.my_vpc.id
}

output "db_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.instances.mydb.endpoint
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = [
    module.my_vpc.public_subnetA.id,
    module.my_vpc.public_subnetB.id,
  ]
}