
resource "aws_instance" "vm" {
  count                       = length(var.public_subnet_cidrs)
  ami                         = "ami-097a2df4ac947655f"
  instance_type               = "t2.micro"
  key_name                    = var.ssh_key_name
  associate_public_ip_address = true
  subnet_id                   = element(var.subnet_ids[*], count.index)
  vpc_security_group_ids      = [var.SG_id]
  volume_tags                 = {

    Name       = "Avshalom-VM-Vol"
    bootcamp   = "15"
    created_by = "Avshalom"
    managed_by = "terraform"
  }
  tags = {
    Name = "${var.prefix}-inst-${count.index+1}}"
  }
  depends_on = [aws_key_pair.ssh_key]
## uncomment to install docker in VM
 # user_data = file("run.sh")
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.ssh_key_name
  public_key = var.ssh_key_public
}