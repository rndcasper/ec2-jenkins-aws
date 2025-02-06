terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"

  backend "s3" {
    bucket = "terraform-brabus-ronaldo"
    key    = "aws-ec2/terraform-ec2.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
    region = var.region

  default_tags {
    tags = {
      owner      = var.owner
      managed-by = "terraform"
    }
  }
}