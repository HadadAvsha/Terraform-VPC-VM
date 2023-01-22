# Generate ssh key pair with ssh-keygen -t rsa -b 2048
# Choose the location that you want your key to be saved along with a key name

variable "ssh_key_name" {
  default = ""
  description = "Enter a name for youre ssh key"
}

variable "ssh_key_public" {
  default = ""
  description = "Paste public key here"
}