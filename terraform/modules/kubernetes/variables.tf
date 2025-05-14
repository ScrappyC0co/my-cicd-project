variable "app_name" {
  default     = "hello-app"
  description = "The name of the Kubernetes app"
}

variable "namespace" {
  default     = "demo"
  description = "Kubernetes namespace for the app"
}

variable "replicas" {
  default     = 2
  description = "Number of app replicas"
}

variable "container_name" {
  default     = "nginx"
  description = "Name of the container"
}

variable "image" {
  default     = "nginx:latest"
  description = "Container image to deploy"
}

variable "container_port" {
  default     = 80
  description = "Container port to expose"
}

variable "username" {
  default     = "admin"
  description = "Secret username"
}

variable "password" {
  default     = "admin123"
  description = "Secret password"
}
