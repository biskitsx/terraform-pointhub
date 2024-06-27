variable "access_key" {}
variable "secret_key" {}

// AWS provider
provider "aws" {
    region     = "ap-southeast-1"
    access_key = var.access_key
    secret_key = var.secret_key
}