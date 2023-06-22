# ================================
# Terraform configuration
# ================================
terraform {
  required_providers {
    vra = {
      source = "vmware/vra"
    }
  }
  required_version = ">= 0.13"
}

# ================================
# Variables declaration
# ================================
variable "url" {
  type = string
  default = "https://api.mgmt.cloud.vmware.com"
}

variable "refresh_token" {
  type = string
}

variable "insecure" {
  type = bool
  default = false
}

variable "project_name" {
  type = string
}

variable "deployment_name" {
  type = string
}

# ================================
# Provider configuration
# ================================
provider "vra" {
  url           = var.url
  refresh_token = var.refresh_token
  insecure      = var.insecure
}

# ================================
# Data
# ================================
data "vra_project" "this" {
  name = var.project_name
}

# ================================
# Resources
# ================================
resource "vra_deployment" "this" {
  name        = var.deployment_name
  description = "Test Deployment created from Terraform"
  project_id  = data.vra_project.this.id
}
