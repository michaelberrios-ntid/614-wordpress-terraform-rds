variable "db_name" {
  type = string
}

variable "username" {
  type      = string
  sensitive = true
}

variable "password" {
  type      = string
  sensitive = true
}

variable "instance_type" {
  type      = string
}

variable "key_name" {
  type      = string
}

variable "vpc_cidr" {
  type    = string
}