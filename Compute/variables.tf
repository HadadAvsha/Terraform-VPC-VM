variable "instance_name" {
  type        = list(string)
  description = "Names of instances"
  default     = ["Avsha_inst1", "Avsha_inst2"]
}
#variable "aws_instance" {
#
#}
variable "ssh_key" {
  description = "ssh key name"
}
variable "subnet_ids" {
  type = list(string)
}
variable "SG_id" {}
variable "vpc_id" {}
variable "prefix" {}
variable "subnets_name" {}
#variable "subnet_ids" {}
variable "public_subnet_cidrs" {}
