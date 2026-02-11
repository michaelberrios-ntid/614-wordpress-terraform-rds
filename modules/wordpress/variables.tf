
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

variable "endpoint" {
  type = string
}
