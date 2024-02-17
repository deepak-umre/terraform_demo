resource "aws_instance" "demo_inst" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]
  key_name	  = "sao_polo"
   tags = {
    Name = "${var.project}-demo-inst"
  }
}
