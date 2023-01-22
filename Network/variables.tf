variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}
variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}
#variable "aws_instance" {
#  description = "aws_instance.vm"
#}
variable "prefix" {}
