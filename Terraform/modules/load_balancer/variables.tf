variable "security_groups" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "public_subnetA" {
  type = string
}

variable "public_subnetB" {
  type = string
}

variable "frontend_a" {
  type = string
}

variable "frontend_b" {
  type = string
}