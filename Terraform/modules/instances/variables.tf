variable "security_groups" {
  type = list(string)
}

variable "public_subnetA" {
  type = string
}

variable "public_subnetB" {
  type = string
}

variable "private_subnetC" {
  type = string
}

variable "private_subnetD" {
  type = string
}

variable "private_subnetE" {
  type = string
}

variable "private_subnetF" {
  type = string
}

variable "valid_duration_hours" {
  default = 6  # Default duration in hours
}