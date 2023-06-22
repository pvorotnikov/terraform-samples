variable "aws_access_key" {
  type = string
  description = "AWS Access Key ID"
}

variable "aws_secret_key" {
  type = string
  description = "AWS Secret Key"
  sensitive = true
}

variable "aws_session_token" {
  type = string
  description = "Temporary session token"
  sensitive = true
}

variable "aws_region" {
  type = string
  description = "AWS Region to work with"
}
