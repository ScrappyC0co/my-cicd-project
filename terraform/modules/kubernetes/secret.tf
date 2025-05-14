resource "kubernetes_secret" "app" {
  metadata {
    name      = "${var.app_name}-secret"
    namespace = var.namespace
  }

  data = {
    USERNAME = base64encode(var.username)
    PASSWORD = base64encode(var.password)
  }

  type = "Opaque"
}
