variable "vpc_id" {
  description = "VPC to associate the security group with" # We require the caller to pass, 
  type        = string                                     # a VPC ID to attach the security group
}
