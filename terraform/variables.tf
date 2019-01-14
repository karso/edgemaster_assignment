variable "aws_region" {
  description = "The AWS region where the infra is launched"
  default     = "us-west-2"
}

variable "aws_profile" {
  description = "The AWS profile for creating the infra"
  default     = "default"
}


variable "az_count" {
  description = "Number of AZs to use in a given region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to use"
  default     = "hashicorp/http-echo:latest"
}

variable "app_port" {
  description = "Port where the app listens to"
  default     = 5678
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 3
}

variable "ecs_autoscale_role" {
  description = "Role arn for the ecsAutocaleRole"
  default     = "arn:aws:iam::158367233910:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
}

variable "ecs_task_execution_role" {
  description = "Role arn for the ecsTaskExecutionRole"
  default     = "arn:aws:iam::158367233910:role/ecsTaskExecutionRole"
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "min_capacity" {
  description = "Minimum number of tasks at any given time"
  default	   = "1"
}  

variable "max_capacity" {
  description = "Minimum number of tasks at any given time"
  default	   = "3"
}  

variable "display_string" {
  description = "The message displayed on WebPage"
  default = "Hello EdgeMaster! :-)"
}
