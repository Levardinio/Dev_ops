variable "location" {
  type        = string
  default     = "West Europe"
  description = "Azure region where resources will be created"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "docker_image" {
  type        = string
  description = "Docker image URL from GHCR.io registry"
}

variable "container_port" {
  type        = number
  description = "Port the container exposes"
  default     = 5000
}