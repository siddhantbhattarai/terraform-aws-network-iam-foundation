variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "use_floci" {
  type    = bool
  default = false
}
variable "floci_endpoint" {
  type    = string
  default = "http://localhost:4566"
}
variable "project_name" {
  type    = string
  default = "network-foundation"
}
variable "environment" {
  type    = string
  default = "dev"
}
variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}
variable "enable_nat_gateway" {
  type    = bool
  default = false
}
