variable "region" {
  type        = string
  description = "AWS Region"
}

variable "env" {
  type        = string
  description = "Env"
}

variable "service_name" {
  type        = string
  description = "Service name"
}

variable "repo_url" {
  type        = string
  description = "ECR repo URL"
}

variable "tag" {
  type        = string
  description = "Default ECS image tag"
  default     = "latest"
}

variable "desired_count" {
  type        = number
  description = "Desired container count"
  default     = 2
}

variable "container_port" {
  type        = number
  description = "ecs container port"
}

variable "subnets_service" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "subnets_alb" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "tls_cert_arn" {
  type        = string
  description = "Alb cert arn"
}

variable "health_check_path" {
  type        = string
  description = "Healtcheck path"
}

variable "container_cpu" {
  type        = number
  description = "task definition container cpu"
  default = 256
}

variable "container_memory" {
  type        = number
  description = "task definition container memory"
  default = 512
}
