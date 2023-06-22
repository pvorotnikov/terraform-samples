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

provider "aws" {
  # region = var.aws_region
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  # token = var.aws_session_token
}

# ================================
# Resources
# ================================
resource "aws_vpc" "app_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.vpc_name}"
    Owner = "${var.vpc_owner}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = "${aws_vpc.app_vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public"
    Owner = "${var.vpc_owner}"
  }
}

resource "aws_subnet" "protected_subnet" {
  vpc_id     = "${aws_vpc.app_vpc.id}"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "protected"
    Owner = "${var.vpc_owner}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = "${aws_vpc.app_vpc.id}"
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "private"
    Owner = "${var.vpc_owner}"
  }
}
