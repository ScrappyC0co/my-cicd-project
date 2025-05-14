output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_certificate_authority" {
  value = module.eks.cluster_certificate_authority_data
}

output "kubeconfig" {
  value = module.eks.kubeconfig
  sensitive = true
}
