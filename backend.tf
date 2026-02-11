terraform {
  backend "s3" {
    bucket       = "614-wordpress-terraform"
    key          = "wordpress-rds/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
  }
}