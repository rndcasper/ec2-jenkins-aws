resource "aws_key_pair" "brabus" {
  key_name   = "brabus-key"
  public_key = file("./brabus-key.pub")
}

resource "aws_instance" "ec2_brabus_p1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.brabus.key_name
  associate_public_ip_address = true
  user_data                   = file("./user-data.sh")

  #subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_pub1_id
  vpc_security_group_ids = [aws_security_group.sg_ec2_pub1.id]

  tags = {
    Name = "ec2-brabus-p1"
  }
}

resource "aws_security_group" "sg_ec2_pub1" {
  name        = "brabus-sg-ec2-pub1" # Nome não pode iniciar com "sg-"
  description = "Utilizar para as EC2 publicas"
  #vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

 ingress {
    description = "Liberar porta 80 para o mundo"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Liberar porta 8080 para o mundo"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Liberar porta 22 para o mundo"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["179.213.231.5/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "sg-brabus-ec2-pub1"
    Projeto  = "Brabus"
    Ambiente = "PRD"
  }
}
