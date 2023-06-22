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

  required_version = ">= 1.0.5"
}

provider "aws" {}

# ================================
# Resources
# ================================
resource "aws_instance" "photon_server" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "${var.machine_name}"
  }
}
