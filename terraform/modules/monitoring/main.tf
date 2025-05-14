module "monitoring" {
  source                  = "./modules/monitoring"
  grafana_admin_password  = "admin123"
}
