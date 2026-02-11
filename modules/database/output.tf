output "rds_endpoint" {
  value = aws_db_instance.wordpress_db.endpoint
}

output "db_endpoint" {
  value = aws_db_instance.wordpress_db.endpoint
}

output "db_name" {
  value = var.db_name
}
