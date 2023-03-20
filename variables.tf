variable "env" {
  description = "Environment"
}

variable "vpc_cidr" {
  description = "cidr block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "cidr block for Public Subnet"
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "cidr block for Private Subnet"
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}