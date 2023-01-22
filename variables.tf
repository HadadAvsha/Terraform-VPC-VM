variable "azs" {
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "instance_name" {
  default = ["Avsha_inst1", "Avsha_inst2"]
}

#variable "subnet_name_prefix" {
#
#}

variable "prefix" {
  type    = string
  description = "naming prefix"
#  default = "Avsha-${terraform.workspace}"
}

