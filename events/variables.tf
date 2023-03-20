variable "env" {
  type        = string
  description = "Environment"
}

variable "incident_management_webhook" {
  type        = string
  description = "Pagerduty, Zenduty, oncall software, etc"
}

variable "ecs_service_list" {
  type        = string
  description = "ECS service list"
}   