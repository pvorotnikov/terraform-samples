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
