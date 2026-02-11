output "wordpress_public_ip" {
  value = module.instances.public_ip
}

output "rds_endpoint" {
  value = module.database.rds_endpoint
}