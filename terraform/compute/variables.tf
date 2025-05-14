variable "vpc_id" {
  type = string     # This tells the EKS cluster which VPC to use.
}

variable "subnet_ids" {
  type = list(string)   # These are the subnets inside the VPC where the nodes will run (must be private or public with internet access).
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string                        # You can override this to name your cluster anything you want.
  default     = "dev-eks"
}
