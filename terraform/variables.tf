variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default = "us-east-1"   # The AWS region we’re working in. 
}                         # us-east-1 is common and works with free-tier resources.



variable "vpc_cidr" { 
  description = "CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"                # The private IP address range for the VPC — this allows up to 65,536 addresses.
}


