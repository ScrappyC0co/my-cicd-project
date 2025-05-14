
module "eks" {
  source          = "terraform-aws-modules/eks/aws" # Pulls the official EKS module from the Terraform Registry
  version         = "~> 20.0"

  cluster_name    = var.eks_cluster_name # Name and 
  cluster_version = "1.29"               # version of the Kubernetes cluster

  vpc_id     = var.vpc_id      # Connects the cluster 
  subnet_ids = var.subnet_ids  # to your custom network

  enable_irsa = true  # Enable IAM roles for service accounts (useful for ArgoCD, Prometheus, etc.)

  eks_managed_node_groups = {  # Defines a small node group for cost-efficiency
    default = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1

      instance_types = ["t3.small"]  # Saves $$ by using AWS Spot Instances (cheap and preemptible).
      capacity_type  = "SPOT"
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true" # We tag the cluster for clarity and billing.
  }
}
