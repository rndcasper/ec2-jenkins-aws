terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"

  backend "s3" {
    bucket = "terraform-brabus"
    key    = "aws-ec2/terraform-ec2.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials" # Caminho do arquivo com as credenciais
  profile = "default" # O nome do perfil no arquivo de credenciais (opcional)
  region = var.region

  default_tags {
    tags = {
      owner      = var.owner
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-brabus"
    key    = "aws-vpc/terraform-vpc.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"

  config = {
    bucket = "terraform-brabus"
    key    = "aws-sg/terraform-sg.tfstate"
    region = "us-east-1"
  }
}