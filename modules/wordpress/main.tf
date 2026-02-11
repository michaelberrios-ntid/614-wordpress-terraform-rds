locals {
  wordpress_user_data = templatefile("${path.module}/wp_rds_install.sh", {
    db_name  = var.db_name
    username = var.username
    password = var.password
    endpoint = var.endpoint
  })
}
