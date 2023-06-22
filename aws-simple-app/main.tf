# ================================
# Terraform configuration
# ================================
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token = var.aws_session_token
}

# ================================
# Resources
# ================================
resource "aws_instance" "photon_server" {
  ami = "ami-01e691056f389ab72"
  instance_type = "t4g.nano"

  tags = {
    Name = "photon-server"
  }
}
