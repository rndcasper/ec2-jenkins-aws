resource "aws_key_pair" "brabus" {
  key_name   = "brabus-key"
  public_key = file("./brabus-key.pub")
}

resource "aws_instance" "ec2_brabus_p1" {
  #count         = "${var.instance_count}"
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.brabus.key_name
  associate_public_ip_address = true
  user_data                   = file("./user-data.sh")

  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_pub1_id
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.sg_pub_id]

  tags = {
    Name = "ec2-brabus-p1"
  }

}

resource "aws_instance" "ec2_brabus_p2" {
  #count         = "${var.instance_count}"
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.brabus.key_name
  associate_public_ip_address = true
  user_data                   = file("./user-data.sh")

  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_pub2_id
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.sg_pub_id]

  tags = {
    Name = "ec2-brabus-p2"
  }

}

resource "aws_instance" "ec2_brabus_pv1" {
  #count         = "${var.instance_count}"
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.brabus.key_name
  associate_public_ip_address = false
  #user_data                   = file("./user-data.sh")

  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_pv1_id
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.sg_pv_id]

  tags = {
    Name = "ec2-brabus-pv1"
  }

}

resource "aws_instance" "ec2_brabus_pv2" {
  #count         = "${var.instance_count}"
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.brabus.key_name
  associate_public_ip_address = false
  #user_data                   = file("./user-data.sh")

  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_pv2_id
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.sg_pv_id]

  tags = {
    Name = "ec2-brabus-pv2"
  }

}