variable "region" {
  type    = string
  default = "us-east-1"
}

variable "owner" {
  type    = string
  default = "ronaldo"
}

variable "ami" {
  type    = string
  default = "ami-007855ac798b5175e"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_count" {
  type    = string
  default = "4"
}

variable "key_name" {
  type      = string
  default   = "brabus-key"
  sensitive = true
}
