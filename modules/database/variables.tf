variable "db_name" {
    type = string
}

variable "username" {
    type = string
    sensitive = true
}

variable "password" {
    type = string
    sensitive = true
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_security_group_ids" {
  type = list(string)
}