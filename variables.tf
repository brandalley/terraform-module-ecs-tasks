variable "env" {
  type = string
}

# variable "ecs_module_enabled" {
#   type        = string
# }

variable "ecs_cluster_arn" {
  type        = string
}

variable "iam_ecs_task_execution_role_arn" {
  type        = string
}

variable "iam_ecs_task_role_arn" {
  type        = string
}

variable "dbpass" {
  type        = string
  sensitive   = true
}

variable "image_url" {
  type = string
}

variable "security_groups" {
  type = list(any)
}

variable "subnets" {
  type = list(any)
}

variable "container_name" {
  type = string
}

variable "cron" {
  type = string
}

variable "order_check_enabled" {
  type = bool
}

variable "order_summary_enabled" {
  type = bool
}