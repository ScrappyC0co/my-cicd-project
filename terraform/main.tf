terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "security" {
  source = "./modules/security"
  vpc_id = module.networking.vpc_id
}

module "compute" {
  source              = "./modules/compute"
  vpc_id              = module.networking.vpc_id
  subnet_ids          = module.networking.public_subnet_ids
  security_group_ids  = module.security.security_group_ids
  eks_cluster_name    = "dev-eks"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

data "aws_eks_cluster" "cluster" {
  name = module.compute.eks_cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.compute.eks_cluster_name
}

module "k8s_app" {
  source = "./modules/kubernetes"
}
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)  # This tells Terraform to use Helm charts inside your EKS cluster.
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}
