variable "monitoring_namespace" {
  default     = "monitoring"
  description = "Namespace for Prometheus and Grafana"
}

variable "prometheus_chart_version" {
  default     = "25.18.0" # You can look up latest
  description = "Prometheus Helm chart version"
}

variable "grafana_chart_version" {
  default     = "7.3.9" # You can update as needed
  description = "Grafana Helm chart version"
}

variable "grafana_admin_password" {
  default     = "admin123"
  description = "Admin password for Grafana dashboard"
}
